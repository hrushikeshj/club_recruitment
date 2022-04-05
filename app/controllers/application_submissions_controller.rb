# frozen_string_literal: true

class ApplicationSubmissionsController < ApplicationController

  before_action :set_application_submission, only: %i[show edit update destroy]

  respond_to :js, :html, :json

  # GET /application_submissions
  def index
    @application_submissions = ApplicationSubmission.all
  end

  # GET /application_submissions/1
  def show; end

  # GET /application_submissions/new
  def new
    @application_submission = ApplicationSubmission.new
  end

  # GET /application_submissions/1/edit
  def edit; end

  def select_clubs
    @clubs = Clubs.all
  end

  # POST /application_submissions
  def create
    @application_submission = ApplicationSubmission.new(application_submission_params)

    respond_to do |format|
      if @application_submission.save
        format.html { redirect_to @application_submission, notice: 'Application submission was successfully created.' }
        format.json { render :show, status: :created, location: @application_submission }
        format.js do
          @cued = true
          render :show, status: :created, location: @application_submission
        end
      else
        format.html { render :new }
        format.js { render :new }
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
end
