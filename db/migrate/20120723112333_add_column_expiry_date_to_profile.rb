class AddColumnExpiryDateToProfile < ActiveRecord::Migration
  def self.up

    add_column :profiles, :expiry_date, :datetime
  end

  def self.down

    remove_column :profiles, :expiry_date
  end
end
