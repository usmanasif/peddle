class AddEntryInRolesTable < ActiveRecord::Migration
  def self.up
    Role.create!   :name => SELLER
    Role.create!   :name => BUYER
    Role.create!   :name => ADMIN
  end

  def self.down
    Role.destroy_all
  end
end
