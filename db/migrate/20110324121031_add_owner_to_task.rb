class AddOwnerToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :owner_id, :integer
    add_column :categories, :user_id, :integer
  end

  def self.down
    remove_column :tasks, :owner_id
    remove_column :categories, :user_id
  end
end
