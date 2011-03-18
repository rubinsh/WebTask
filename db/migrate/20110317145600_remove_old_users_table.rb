class RemoveOldUsersTable < ActiveRecord::Migration
  def self.up
    drop_table :users
    drop_table :sessions
  end

  def self.down
  end
end
