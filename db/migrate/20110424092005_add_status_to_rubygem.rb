class AddStatusToRubygem < ActiveRecord::Migration
  def self.up
    add_column :rubygems, :status, :string, :default => 'new', :null => false
  end

  def self.down
    remove_column :rubygems, :status
  end
end
