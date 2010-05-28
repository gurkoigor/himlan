class CreateScreenshots < ActiveRecord::Migration
  def self.up
    create_table :screenshots do |t|
      t.integer :reliz_id
      t.string :screenshot_file_name
      t.string :screenshot_content_type
      t.integer :screenshot_file_size
      t.datetime :screenshot_updated_at
      t.timestamp
    end
  end

  def self.down
    drop_table :screenshots
  end
end
