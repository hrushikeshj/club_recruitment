# frozen_string_literal: true

class ClubsController < ApplicationController

  before_action :set_club, only: %i[show edit update destroy dashboard selected_applications selected_candidates]

  authorize_resource

  respond_to :js, :html, :json

  # GET /clubs/:id/selected_candidates
  def selected_candidates
    render 'selected_candidates', layout: 'print'
  end

  # GET /all_selected_candidates
  def all_selected_candidates
    render 'all_selected_candidates', layout: 'print'
  end

  # GET /clubs/:id/dashboard
  def dashboard
    @submissions = @club.application_submissions.includes(:user)
  end

  # GET /council_dashboard
  def council_dashboard; end

  # GET /clubs/:id/selected_applications
  ## selected applications - top of the preference list
  def selected_applications
    @selected_applications = @club.selected_applications
  end

  # GET /clubs
  def index
    @clubs = Club.all

    render 'show_all' if params[:display] == 'card' || !current_user&.admin?
  end

  # GET /clubs/1
  def show; end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit; end

  # POST /clubs
  def create
    @club = Club.new(club_params)

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @club }
        format.js do
          @cued = true
          render :show, status: :created, location: @club
        end
      else
        format.html { render :new }
        format.js { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubs/1
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to dashboard_club_path, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
        format.js do
          @cued = true
          render :show, status: :ok, location: @club
        end
      else
        format.html { render :edit }
        format.js { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_club
    @club = Club.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def club_params
    params.require(:club).permit(:name, :info, :description, :short_name, :cover_pic)
  end
end
