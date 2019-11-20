class UsersController < ApplicationController

  before_action :redirect_if_logged, only: %i[new create]

  def new
    redirect_to root_path if logged_in?

    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to tests_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
