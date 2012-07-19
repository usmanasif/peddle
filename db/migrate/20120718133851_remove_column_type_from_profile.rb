class RemoveColumnTypeFromProfile < ActiveRecord::Migration
  def self.up
    remove_column :profiles, :type

  end

  def self.down
    add_column :profiles, :type, :string
  end
end
