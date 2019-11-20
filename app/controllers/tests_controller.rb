class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test, only: %i[show destroy edit update show start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    @tests = Test.order(:id)
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.author_id=current_user.id
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def show
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.get_test_passage_by_test(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_record_not_found
    render plain: 'Record was not found'
  end
end
