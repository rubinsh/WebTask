class CreateTasksUsers < ActiveRecord::Migration
  def self.up
    create_table :tasks_users, :id => false do |t|
      t.references :task
      t.references :user
    end
  end

  def self.down
    drop_table :tasks_users
  end
end
