class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.text :url
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
    add_index :gists, :url
  end
end
