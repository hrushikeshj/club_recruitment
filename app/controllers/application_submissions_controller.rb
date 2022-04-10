# frozen_string_literal: true

class ApplicationSubmissionsController < ApplicationController

  before_action :set_application, only: %i[new create edit_preference select_clubs]
  before_action :set_application_submission, only: %i[show edit update destroy update_preference]

  respond_to :js, :html, :json

  # GET /applications/:application_id/application_submissions/edit_preference
  def edit_preference
    @application_submissions = @application.application_submissions.includes(:club)
  end

  # POST /application_submissions/:id/update_preference
  def update_preference
    ApplicationSubmission.update_preference(@application_submission, params[:new_pref])

    app = @application_submission.application
    @subs = app.application_submissions.includes(:club)

    # TODO: loader gif
    render inline: "<%= render 'preference', application_submissions: @subs %>"
  end

  # GET /applications/:application_id/application_submissions/select_clubs
  def select_clubs
    @clubs = Club.all
  end

  # GET /clubs/:club_id/application_submissions
  def index
    @club = Club.find(params[:club_id])
    @application_submissions = @club.application_submissions.includes(:user)
  end

  # GET /application_submissions/1
  def show; end

  # GET /application_submissions/new
  def new
    @application_submission = ApplicationSubmission.new
  end

  # GET /application_submissions/1/edit
  def edit; end

  # POST /application_submissions
  def create
    @application_submission = @application.application_submissions.new(club_id: params[:club_id])

    respond_to do |format|
      if @application_submission.save
        format.html { redirect_to @application_submission, notice: 'Application submission was successfully created.' }
        format.json { render :show, status: :created, location: @application_submission }
        format.js
      else
        format.html { render :new }
        format.js
        format.json { render json: @application_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /application_submissions/1
  def update
    respond_to do |format|
      if @application_submission.update(application_submission_params)
        format.html { redirect_to @application_submission, notice: 'Application submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @application_submission }
        format.js do
          @cued = true
          render :show, status: :ok, location: @application_submission
        end
      else
        format.html { render :edit }
        format.js { render :edit }
        format.json { render json: @application_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_submissions/1
  def destroy
    @application_submission.destroy
    respond_to do |format|
      format.html { redirect_to application_submissions_url, notice: 'Application submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_application_submission
    @application_submission = ApplicationSubmission.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def application_submission_params
    params.require(:application_submission).permit(:application_id, :club_id, :preference_no, :status, :marks, :selected)
  end

  def set_application
    @application = Application.find(params[:application_id])
  end
end
