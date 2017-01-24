class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :json

  protected

  def current_user
    @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
