class ApplicationController < ActionController::API
  before_action :configure_permited_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  # before_action :authenticate_nutritionist!

  protected

  def configure_permited_parameters
    # Check if it is User or Nutritionist
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name last_name rut phone])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name last_name rut phone])
    elsif resource_class == Nutritionist
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name last_name rut phone academic_title company])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name last_name rut phone academic_title company])
    end
  end

  def authenticate_user_or_nutritionist!
    unless current_user || current_nutritionist
      render json: { error: 'You must sign in as user or nutritionist' }, status: :unauthorized
    end
  end
end
