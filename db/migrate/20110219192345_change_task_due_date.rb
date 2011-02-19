class ChangeTaskDueDate < ActiveRecord::Migration
  def self.up
    change_column :tasks, :due_date, :date
  end

  def self.down
    change_column :tasks, :due_date, :datetime
  end
end
