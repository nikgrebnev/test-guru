require 'digest/sha1'

class User < ApplicationRecord

# заменили это на has_secure_password
#  include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: :author_id

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  has_secure_password

  def passed_tests(level)
    tests.by_level(level).select(:id, :title)
#    tests.where(level: level).select(:id, :title)
  end

  def get_test_passage_by_test(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
