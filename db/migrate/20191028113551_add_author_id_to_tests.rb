class AddAuthorIdToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :author_id, :integer, default: 0
    remove_column :tests, :author
    remove_column :tests, :user_id
  end
end
