class ApplicationController < ActionController::Base
  helper_method :current_user, :oauth_access

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def oauth_access
    return nil if session[:oauth_token].nil?

    @oauth_access ||= Oauth.access_from_token(session[:oauth_token])
  end

  def current_ability
    @current_ability ||= UserAbility.new(current_user)
                          .merge(ApplicationAbility.new(current_user))
                          .merge(ClubAbility.new(current_user))
                          .merge(ApplicationSubmissionAbility.new(current_user))
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html do
        if current_user
          redirect_to applicant_dashboard_user_path(current_user), alert: exception.message
        else
          redirect_to login_path, alert: exception.message
        end
      end
      format.js { render 'shared/access_denied' }
    end
  end
end
