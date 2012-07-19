class CreateTableStorePackages < ActiveRecord::Migration
  def self.up
    create_table :store_packages, :force => true do |t|
      t.string :name

    end


  end

  def self.down

    drop_table :store_packages
  end
end
