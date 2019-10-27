class User < ApplicationRecord
  has_many :passes
  has_many :tests, through: :passes

  def passed_tests(level)
    Test.where("level = ? and id in (select test_id from passes where user_id = ?)", level.to_i, self.id).select(:id, :title)
#    Pass.where("user_id = ? and test_id in (select id from tests where level = ?)", self.id, level.to_i)
  end
end
