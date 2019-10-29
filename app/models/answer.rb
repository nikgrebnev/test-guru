class Answer < ApplicationRecord
  belongs_to :question

  scope :right_answers, -> (question) { where(question_id: question) }

  validates :body, presence: true

  validate :validate_max_answers, on: :create

  private

  def validate_max_answers
    errors.add(:base, 'Max 4 answers.') if question.answers.count > 4
  end

end
