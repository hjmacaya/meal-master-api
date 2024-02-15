class ApplicationController < ActionController::API
  before_action :configure_permited_parameters, if: :devise_controller?

  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name last_name rut phone])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name last_name rut phone])
  end
end
