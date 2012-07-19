class ChangeColumnNumberInProfile < ActiveRecord::Migration
  def self.up
    remove_column :profiles, :number
    add_column  :profiles, :credit_card_number , :string
  end

  def self.down
    remove_column :profiles, :credit_card_number
  end
end
