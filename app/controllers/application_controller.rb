class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_default_response_format, if: :api_request?

  def after_sign_in_path_for(_resource)
    users_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[name bio email photo password confirm_password]
    )
    devise_parameter_sanitizer.permit(
      :sign_in, keys: %i[email password]
    )
  end

  def set_default_response_format
    request.format = :json
  end

  def api_request?
    request.path.start_with?('/api/')
  end
end
