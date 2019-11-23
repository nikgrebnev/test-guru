class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test, only: %i[start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    @tests = Test.order(:id)
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.get_test_passage_by_test(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_record_not_found
    render plain: 'Test not found'
  end
end
