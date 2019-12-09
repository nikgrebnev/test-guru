class AddSuccessToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :success, :boolean
    remove_column :test_passages, :result
  end
end
