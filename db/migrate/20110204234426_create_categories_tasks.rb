class CreateCategoriesTasks < ActiveRecord::Migration
  def self.up
    create_table :categories_tasks, :id => false do |t|
      t.references :task
      t.references :category
    end
  end

  def self.down
    drop_table :categories_tasks
  end
end
