class DropTablePasses < ActiveRecord::Migration[6.0]
  def up
    drop_table :passes, if_exists: true
    drop_table :test_passes, if_exists: true
#    drop_table :passes if ActiveRecord::Base.connection.tables.include?('passes')
#    drop_table :test_passes if ActiveRecord::Base.connection.tables.include?('test_passes')
  end
end
