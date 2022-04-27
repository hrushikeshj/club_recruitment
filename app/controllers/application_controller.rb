class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
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
      format.html { redirect_to login_path, alert: exception.message }
      format.js { render 'shared/access_denied' }
    end
  end
end
