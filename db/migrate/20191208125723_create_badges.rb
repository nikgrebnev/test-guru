class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.text :title
      t.text :url
      t.integer :badge_rule
      t.integer :badge_type

      t.timestamps
    end
  end
end
