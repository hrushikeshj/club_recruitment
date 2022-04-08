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
    @current_ability ||= UserAbility.new(current_user).merge(ApplicationAbility.new(current_user))
    p @current_ability 
  end
end
