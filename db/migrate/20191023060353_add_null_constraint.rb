class AddNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:categories, :title, false)
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
    change_column_null(:questions, :body, false)
    change_column_null(:users, :login, false)
    change_column_null(:users, :password, false)
    change_column_null(:answers, :correct, false)
  end
end
