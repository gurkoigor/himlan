class AddParamsFormAndYearIssue < ActiveRecord::Migration
  def self.up
    add_column :relizs, :params_form, :text
    add_column :relizs, :year_issue, :integer
  end

  def self.down
    remove_column :relizs, :params_form
    remove_column :relizs, :year_issue
  end
end
