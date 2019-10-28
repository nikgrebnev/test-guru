class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: User
  has_many :questions
  has_many :passes
  has_many :users, through: :passes

  def self.category_find(title)
    Test
      .joins(:category)
      .where(categories: {title: title})
      .order(id: :desc)
      .pluck(:title)
  end
end
