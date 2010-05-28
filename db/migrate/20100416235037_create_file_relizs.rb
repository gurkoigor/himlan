class CreateFileRelizs < ActiveRecord::Migration
  def self.up
    create_table :file_relizs do |t|
      t.integer :reliz_id
      t.string :file_reliz_file_name
      t.string :file_reliz_content_type
      t.integer :file_reliz_file_size
      t.datetime :file_reliz_updated_at
      t.timestamp
    end
  end

  def self.down
    drop_table :file_relizs
  end
end
