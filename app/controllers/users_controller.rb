# frozen_string_literal: true

class UsersController < ApplicationController
  authorize_resource

  before_action :set_user, only: %i[show edit update destroy]

  # GET /clubs/:club_id/users
  def club_users
    @club = Club.find(params[:club_id])
    @users = @club.users
  end

  # GET /users
  def index
    @users = User.all.includes(:club, :roles)
  end

  # GET /users/1
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        format.js do
          @cued = true
          render :show, status: :created, location: @user
        end
      else
        format.html { render :new }
        format.js { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        format.js do
          @cued = true
          render :show, status: :ok, location: @user
        end
      else
        format.html { render :edit }
        format.js { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :roll_no, :email, :club_id, :password, :password_confirmation, role_ids: [])
  end
end
