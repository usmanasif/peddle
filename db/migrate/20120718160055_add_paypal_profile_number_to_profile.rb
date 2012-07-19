class AddPaypalProfileNumberToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :paypal_profile_number, :string
  end

  def self.down
    remove_column :profiles, :paypal_profile_number
  end
end
