class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :passes
  has_many :users, through: :passes

  scope :by_level, -> (level) { where(level: level) }
  scope :easy,   -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard,   -> { by_level(5..Float::INFINITY) }
  scope :category_title, -> (title) { joins(:category).where(categories: {title: title}) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :title, uniqueness: { scope: :level, message: "title and level must be unique pair" }

  def self.category_find(title)
    Test.category_title(title).order(id: :desc).pluck(:title)
#      Test
#        .joins(:category)
#        .where(categories: {title: title})
#        .order(id: :desc)
#        .pluck(:title)
  end
end
