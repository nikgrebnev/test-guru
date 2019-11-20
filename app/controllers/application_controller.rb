class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  private

  def redirect_if_logged
    redirect_to root_path if logged_in?
  end
end
