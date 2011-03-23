class CreateUserTasks < ActiveRecord::Migration
  def self.up
    rename_table :tasks_users, :user_category_tasks
    change_table(:user_category_tasks) do |t|
      t.references :category
      t.column :id, :primary_key
    end
  end

  def self.down
    remove_column :user_category_tasks, :id
    remove_column :user_category_tasks, :category_id
    rename_table :user_category_tasks, :tasks_users

  end

end
