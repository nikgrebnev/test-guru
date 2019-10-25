class CreatePasses < ActiveRecord::Migration[6.0]
  def change
    create_table :passes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.integer :result

      t.timestamps
    end
  end
end
