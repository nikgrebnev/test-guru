class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: :author_id

  validates :email, presence: true

  def passed_tests(level)
    tests.by_level(level).select(:id, :title)

#    tests.where(level: level).select(:id, :title)
#    Test
#      .joins(:passes)
#      .where(passes: {user_id: self.id})
#      .where(level: level)
#      .select(:id, :title)
#    Test.where("level = ? and id in (select test_id from passes where user_id = ?)", level.to_i, self.id).select(:id, :title)
#    Pass.where("user_id = ? and test_id in (select id from tests where level = ?)", self.id, level.to_i)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
