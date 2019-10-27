class AddAuthorToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :author, :integer, default: 0
  end
end
