class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def show
  end

  def new
    #GET    /tests/:test_id/questions/new(.:format)
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
#  rescue
#    render plain: "Test not find"
  end

  def find_question
    @question = Question.find(params[:id])
#  rescue
#    render plain: "Question not find"
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_record_not_found
    render plain: 'Record was not found'
  end
end
