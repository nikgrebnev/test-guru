class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result]
  before_action :set_success, only: %i[result]


  def show
  end

  def result
#    @success, @success_percent = @test_passage.success
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_success
    @test_passage.success_percent
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
