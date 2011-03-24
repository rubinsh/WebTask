class RemoveTableCategoriesTasks < ActiveRecord::Migration
  def self.up
    drop_table :categories_tasks
  end

  def self.down
  end
end
