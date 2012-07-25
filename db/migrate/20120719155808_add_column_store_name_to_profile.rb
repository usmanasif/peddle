class AddColumnStoreNameToProfile < ActiveRecord::Migration
  def self.up
    remove_column :users, :store_name
    add_column :profiles, :store_name, :string
  end

  def self.down
    add_column :users, :store_name, :string
    remove_column :profiles, :store_name
  end
end
