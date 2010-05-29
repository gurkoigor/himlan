class AddStatusToReliz < ActiveRecord::Migration
  def self.up
    add_column :relizs, :status, :string, :default => "Новый"
  end

  def self.down
    remove_column :relizs, :status
  end
end
