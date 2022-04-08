# frozen_string_literal: true

class ApplicationsController < ApplicationController
  before_action :set_user, only: %i[index new create]
  before_action :set_application, only: %i[show edit update destroy submit_application]

  authorize_resource

  respond_to :js, :html, :json

  # GET /users/:user_id/applications
  def index
    @applications = @user.application
    @applications = Application.where(id: @applications&.id)
  end

  # GET /applications/1
  def show; end

  # GET /users/:user_id/applications/new
  def new
    ## .build_application will delete ans application if it alredy exist

    if @user.application.nil? 
      @application = @user.build_application
    else
      respond_to do |format|
        format.html { redirect_to @user.application, alert: "Application is alredy created!!" }
        format.js { render js: "alert(\"Application is alredy created!!\")" }
      end
    end
  end

  # GET /applications/1/edit
  def edit; end

  # POST /users/:user_id/applications
  def create
    @application = @user.build_application(application_params)

    respond_to do |format|
      if @application.save
        format.html { redirect_to select_clubs_application_application_submissions_path(@application), notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
        format.js do
          @cued = true
          render :show, status: :created, location: @application
        end
      else
        format.html { render :new }
        format.js { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to select_clubs_application_application_submissions_path(@application), notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
        format.js do
          @cued = true
          render :show, status: :ok, location: @application
        end
      else
        format.html { render :edit }
        format.js { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to user_applications_path(@application.user), notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_application
    @application = Application.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def application_params
    params.require(:application).permit(:user, :projects, :skills, :github_link)
  end
end