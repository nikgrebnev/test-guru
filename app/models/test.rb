class Test < ApplicationRecord
  belongs_to :category

  def self.category_find(title)
    Test
      .joins(:category)
      .where(categories: {title: title})
      .order(id: :desc)
      .pluck(:title)
  end
end
