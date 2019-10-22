class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :login, null: false
      t.text :password, null: false

      t.timestamps
    end
  end
end
