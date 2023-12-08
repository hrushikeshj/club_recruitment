class SessionsController < ApplicationController
  def new
  end

  def via_oauth
    redirect_to Oauth.authorize_url
  end

  def oauth_callback
    if params[:error] && params[:code].nil?
      redirect_to('/login', alert: "OAuth authentication failed") && return
    end

    code = params[:code]
    client = Oauth.client

    access = client.auth_code.get_token(code, redirect_uri: OAUTH_CALLBACK_URL)
    session[:oauth_token] = access.token

    p access.token
    begin
      user_info = JSON.parse(access.get('/users/info.json').body)
    rescue JSON::ParserError
      redirect_to('/login', alert: "JSON prase error") && return
    end

    user = User.find_by(email: user_info["email"])
    if user
      session[:user_id] = user.id
      if user.applicant?
        redirect_to applicant_dashboard_user_path(current_user), notice: 'Logged in via OAuth!'
      elsif user.council?
        redirect_to council_dashboard_path, notice: 'Logged in via OAuth!'
      else
        redirect_to root_url, notice: user_info['email'] + 'Logged in  via OAuth!'
      end

      return
    end

    redirect_to '/login', alert: user_info['email'] + "User not found"
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
    session[:oauth_token] = nil
    redirect_to login_path, notice: 'Logged out!'
  end
end
