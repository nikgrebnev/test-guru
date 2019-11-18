class TestsController < ApplicationController

  before_action :set_test, only: %i[show destroy edit update show start]
  before_action :set_user, only: :start

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
    @user.tests.push(@test)
    redirect_to @user.get_test_passage_by_test(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_record_not_found
    render plain: 'Record was not found'
  end
end
