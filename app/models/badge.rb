class Badge < ApplicationRecord

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :url, :badge_rule, :badge_type, presence: true

  def rule
    rules = {
        1 => 'check_first_attempt',
        2 => 'check_all_tests_by_level',
        3 => 'check_all_tests_in_category'
    }
    rules[self.badge_rule]
  end
end
