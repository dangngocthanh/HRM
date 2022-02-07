class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  def isAdmin
    current_user.role.role_name_id
  end

  private
  def user_not_authorized
    flash[:error] = t "notification.not_admin"
    redirect_to request.referrer || new_user_session_path
  end


  protected
  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :name, :dob, :address, :phone]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
