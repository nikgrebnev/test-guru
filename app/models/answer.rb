class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true

  validate :validate_max_answers, on: :create

  private

  def validate_max_answers
    errors.add(:base, :max_answers, count: 4) if question.answers.count > 3
  end

end
