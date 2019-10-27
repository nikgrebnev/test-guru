class User < ApplicationRecord
  has_many :passes
  has_many :tests, through: :passes
  has_many :tests

  def passed_tests(level)
    Test
      .joins(:passes)
      .where(passes: {user_id: self.id})
      .where(tests: {level: level})
      .select(:id, :title)

#    Test.where("level = ? and id in (select test_id from passes where user_id = ?)", level.to_i, self.id).select(:id, :title)
#    Pass.where("user_id = ? and test_id in (select id from tests where level = ?)", self.id, level.to_i)
  end
end
