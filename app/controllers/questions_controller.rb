class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    result = @test.questions.order(:id).select(:id, :body)
    respond_to do |format|
      format.html { render html: result.map(&:body).join('<BR>').html_safe }
      format.json { render json: { questions: result } }
    end
  end

  def show
    render plain: @question.body
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: "Question saved"
    else
      render plain: "Can't create question: " + question.errors.full_messages.inspect
    end
  end

  def new
    #GET    /tests/:test_id/questions/new(.:format)
  end

  def destroy
    @question.destroy
    render plain: 'Deleted'
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
