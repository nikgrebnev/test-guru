class User < ApplicationRecord

  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: :author_id
  has_many :gists
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def passed_tests(level)
    tests.by_level(level).select(:id, :title)
#    tests.where(level: level).select(:id, :title)
  end

  def get_test_passage_by_test(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

end
