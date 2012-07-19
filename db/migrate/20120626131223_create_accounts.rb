class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts, :force => true do |t|
      t.string :title
      t.string :price
      t.string :features
      t.datetime :image_updated_at
      t.timestamps
    end


  end

  def self.down

    drop_table :accounts
  end

end
