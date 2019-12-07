class TestPassage < ApplicationRecord
  TEST_SUCCESS = 5.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create
#  before_validation :before_validation_set_next_question, on: :update

  def success?
    success_percent >= TEST_SUCCESS && !timeout?
  end

  def success_percent
    @success_percent ||= (correct_questions.to_f/test.questions.count.to_f*100).to_i
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
# заменили на before_validation :before_validation_set_next_question
    self.current_question = next_question
    if completed?
      self.success = success?
    end
    save!
  end

  def completed?
    current_question.nil?
  end

  def timeout?
    !current_question.nil?
  end

  def progress
    questions_array = test.get_question_ids
    (100.0 * questions_array.index(current_question.id).to_f / questions_array.size.to_f).to_i
#    (questions_array.index(current_question.id)+1).to_s + '/' + questions_array.size.to_s
  end

  def time_left
    @time_left ||= self.test.timer == 0 ? nil : (self.test.timer + self.created_at.to_i - Time.now.to_i)
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

 # def before_validation_set_next_question
 #   self.current_question = next_question # unless completed?
 # end

  def correct_answer?(answer_ids)
    answer_ids ||= []
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
