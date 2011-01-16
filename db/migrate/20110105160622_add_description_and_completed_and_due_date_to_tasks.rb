class AddDescriptionAndCompletedAndDueDateToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :description, :string
    add_column :tasks, :completed, :boolean
    add_column :tasks, :due_date, :datetime
  end

  def self.down
    remove_column :tasks, :due_date
    remove_column :tasks, :completed
    remove_column :tasks, :description
  end
end
