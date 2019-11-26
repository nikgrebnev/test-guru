module QuestionsHelper
  def question_header
    if @question.persisted?
      t('admin.nav.edit_question_title', title: @question.test.title)
    else
      t('admin.nav.new_question_title', title: @question.test.title)
    end
  end
end
