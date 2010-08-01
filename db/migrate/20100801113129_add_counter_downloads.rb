class AddCounterDownloads < ActiveRecord::Migration
  def self.up
    add_column :relizs, :counter_downloads, :integer, :default => 0
  end

  def self.down
    remove_column(:relizs, :counter_downloads)
  end
end
