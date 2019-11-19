class SessionsController < ApplicationController

  before_action :redirect_if_logged, only: %i[new]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      from_path = cookies[:from_path]
      cookies.delete :from_path
      redirect_to from_path || tests_path
    else
      flash.now[:alert] = 'Email or password uncorrect'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
