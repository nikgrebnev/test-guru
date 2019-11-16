class Answer < ApplicationRecord
  belongs_to :question

#  scope :right_answers, -> (question) { where(question_id: question) }
  scope :correct, -> { where(correct: true) }

  validates :body, presence: true

  validate :validate_max_answers, on: :create

  private

  def validate_max_answers
    errors.add(:base, 'Max 4 answers.') if question.answers.count > 3
    # почему тут 3, а не 4 - т.к. новый созданный вопрос УЖЕ влючается в подсчет... Или нет?
  end

end
