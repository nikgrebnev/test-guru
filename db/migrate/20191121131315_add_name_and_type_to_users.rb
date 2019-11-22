class AddNameAndTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :text
    add_column :users, :first_name, :text
    add_column :users, :last_name, :text
    remove_column :users, :name
    remove_column :users, :surname
  end
end
