class ChangeTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :type
    add_column :users, :type, :text, null: false, default: 'User'

#    change_column_default(:users, :type, from: nil, to: 'User')
#    change_column_null(:users, :type, false)
  end
end
