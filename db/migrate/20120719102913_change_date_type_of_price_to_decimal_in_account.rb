class ChangeDateTypeOfPriceToDecimalInAccount < ActiveRecord::Migration
  def self.up
    remove_column :accounts, :price
    add_column  :accounts, :price , :decimal
  end

  def self.down
    remove_column :accounts, :price
  end
end
