class CreateTableBanners < ActiveRecord::Migration
  def self.up
    create_table :banners, :force => true do |t|
      t.string :name

    end


  end

  def self.down

    drop_table :banners
  end
end
