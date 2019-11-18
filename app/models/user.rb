class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: :author_id

  validates :email, presence: true

  def passed_tests(level)
    tests.by_level(level).select(:id, :title)
#    tests.where(level: level).select(:id, :title)
  end

  def get_test_passage_by_test(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
