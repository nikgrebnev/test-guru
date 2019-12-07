class AddResultToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :result, :integer
    add_index :test_passages, :result
  end
end
