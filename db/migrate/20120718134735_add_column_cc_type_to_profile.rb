class AddColumnCcTypeToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :cc_type, :string
  end

  def self.down
    remove_column :profiles, :cc_type
  end
end
