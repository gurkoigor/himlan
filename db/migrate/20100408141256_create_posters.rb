class CreatePosters < ActiveRecord::Migration
  def self.up
    create_table :posters do |t|
      t.integer :reliz_id
      t.string :poster_file_name
      t.string :poster_content_type
      t.integer :poster_file_size
      t.datetime :poster_updated_at
      t.timestamp
    end
  end

  def self.down
    drop_table :posters
  end
end
