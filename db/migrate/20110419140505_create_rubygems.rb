class CreateRubygems < ActiveRecord::Migration
  def self.up
    create_table :rubygems do |t|
      t.string :name, :null => false
      t.string :version, :null => false
      t.text :description, :null => false
      t.string :gem_uri, :null => false
      t.string :source_code_uri

      t.timestamps
    end
  end

  def self.down
    drop_table :rubygems
  end
end
