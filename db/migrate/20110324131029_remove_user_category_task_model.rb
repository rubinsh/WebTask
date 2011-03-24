class RemoveUserCategoryTaskModel < ActiveRecord::Migration
  def self.up
    drop_table :user_category_tasks
  end

  def self.down
  end
end
