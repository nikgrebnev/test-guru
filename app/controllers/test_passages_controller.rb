class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :set_success, only: %i[result]

  def show
  end

  def result
    @test_passage.save_result
#    @success, @success_percent = @test_passage.success
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question, current_user).call

    if result
      create_gist(result)
#      flash_options = { notice: "#{t('gist.success')} #{get_gist_url(result)}" }
# target blank теряется!
      gist_link = view_context.link_to(t('nav.show'), @gist_url, class: 'btn btn-primary', target: :blank)
      flash_options = { notice: t('gist.success'), url: gist_link }
      puts flash_options.inspect
    else
      flash_options = { notice: t('gist.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_success
    @test_passage.success_percent
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def create_gist(result)
    current_user.gists.create!(question: @test_passage.current_question, url: get_gist_url(result))
  end

  def get_gist_url(result)
    @gist_url ||= result[:html_url]
#    @gist_url ||= JSON.parse(result.body)["html_url"]
  end

end
