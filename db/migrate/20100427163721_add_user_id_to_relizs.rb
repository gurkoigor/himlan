class AddUserIdToRelizs < ActiveRecord::Migration
  def self.up
    add_column :relizs, :user_id, :integer
  end

  def self.down
    remove_column(:relizs, :user_id)
  end
end
