module QuestionsHelper
  def question_header
    if @question.persisted?
      "Edit '#{@question.body}' Question"
    else
      "Create new '#{@question.body}' Question"
    end
  end
end
