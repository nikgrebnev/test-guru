class AddEmailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :text
    add_index :users, :email
  end
end
