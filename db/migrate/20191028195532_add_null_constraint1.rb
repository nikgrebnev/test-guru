class AddNullConstraint1 < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:users, :email, false)
    add_index :tests, :author_id
    add_index :tests, :title
  end
end
