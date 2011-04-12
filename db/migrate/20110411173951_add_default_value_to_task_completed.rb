class AddDefaultValueToTaskCompleted < ActiveRecord::Migration
  def self.up
   change_column :tasks, :completed, :boolean, :default => false
  end

  def self.down
    change_column :tasks, :completed, :boolean, :default => nil
  end
end
