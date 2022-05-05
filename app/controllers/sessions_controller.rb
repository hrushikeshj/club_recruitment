class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.applicant?
        redirect_to applicant_dashboard_user_path(current_user), notice: 'Logged in!'
      elsif user.council?
        redirect_to council_dashboard_path, notice: 'Logged in!'
      else
        redirect_to root_url, notice: 'Logged in!'
      end
    else
      flash[:alert] = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out!'
  end
end
