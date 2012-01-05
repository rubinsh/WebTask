class DropCkeditorAssets < ActiveRecord::Migration
  def self.up
    drop_table :ckeditor_assets
  end

  def self.down
  end
end
