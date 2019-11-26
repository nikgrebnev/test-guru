class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def default_url_options
    { lang: current_locale }
  end

  private

  def current_locale
    I18n.locale == I18n.default_locale ? nil : I18n.locale
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def after_sign_in_path_for(resource)
    flash[:alert] = "Hello, #{current_user.first_name} #{current_user.last_name}!"
    current_user.admin? ? admin_tests_path : root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
