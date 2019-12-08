class BadgesController < ApplicationController

  before_action :authenticate_user!

  def index
    @all_badges = Badge.order(:id)
    @my_badges = current_user.badges.order(created_at: :desc)
  end
end
