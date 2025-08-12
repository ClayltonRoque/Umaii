class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [ :email ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :user_type, :email ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :user_type, :email ])
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  private
end
