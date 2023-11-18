class SessionsController < ApplicationController
  def new
    session[:return_to_c] = params[:return_to_c] if params[:return_to_c].present?
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      if session[:return_to_c].present?
        redirect_to session[:return_to_c]
        session[:return_to_c] = nil
        return
      end

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
