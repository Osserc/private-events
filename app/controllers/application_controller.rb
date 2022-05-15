class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  def show
    @user = User.find(params[:id])
  end

  def check_right_user(event)
    if user_signed_in?
      return true if event.user_id == current_user.id
      return true if event.invitees.include?(current_user)
      return false
    else
      return false
    end
  end
  helper_method :check_right_user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
  end

end
