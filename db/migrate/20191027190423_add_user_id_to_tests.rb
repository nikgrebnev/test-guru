class AddUserIdToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :user_id, :integer, default: 0
  end
end
