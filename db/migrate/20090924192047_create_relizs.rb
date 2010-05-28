class CreateRelizs < ActiveRecord::Migration
  def self.up
    create_table :relizs do |t|
      
      t.references :subcategory
      t.string :name
      t.string :title
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :relizs
  end
end
