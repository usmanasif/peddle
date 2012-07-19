class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string   :type
      t.string   :number
      t.integer  :verification_value
      t.integer  :month
      t.integer  :year
      t.string  :first_name
      t.string  :last_name
      t.string  :street_1
      t.string  :city
      t.string  :state
      t.string  :country
      t.integer  :zip
      t.string  :email
      t.timestamps
    end
  end
  def self.down
    drop_table :profiles
  end
end
