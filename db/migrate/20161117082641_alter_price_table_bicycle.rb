class AlterPriceTableBicycle < ActiveRecord::Migration[5.0]
  def up
    change_column :bicycles, :price, :decimal ,precision: 10, scale: 2
  end

  def down
    change_column :bicycles, :price, :decimal
  end
end
