class CreateSubcategories < ActiveRecord::Migration
  def self.up
    create_table :subcategories do |t|

      t.string :title
      t.string :name
      t.references :category
    end
  end

  def self.down
    drop_table :subcategories
  end
end
