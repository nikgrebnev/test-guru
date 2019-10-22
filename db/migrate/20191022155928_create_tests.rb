class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.text :title, null: false
      t.integer :level, null: false, default: 0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tests, :level
  end
end
