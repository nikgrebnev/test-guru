class FeedbacksController < ApplicationController

  before_action :authenticate_user!
  before_action :validate_body, only: %i[create]

  def new
  end

  def create
    FeedbacksMailer.submit_feedback(current_user, body_params).deliver_now
    redirect_to root_path, notice: t('nav.feedback_send')
  end

  private

  def validate_body
    body = body_params
    return true if body.present? && body.length > 5
    redirect_to :new
  end

  def body_params
    params[:body]
  end

end
