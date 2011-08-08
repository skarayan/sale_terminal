class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.integer :product_id
      t.integer :volume
      t.float :price

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
