class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :login
      t.text :password

      t.timestamps
    end
  end
end
