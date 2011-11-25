class AddCategorizationsUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :categorizations, [:category_id, :task_id], :unique => true
  end

  def self.down
    remove_index :categorizations, [:category_id, :task_id]
  end
end
