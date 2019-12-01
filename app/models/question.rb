class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :delete_all
  has_many :gists

  validates :body, presence: true

end
