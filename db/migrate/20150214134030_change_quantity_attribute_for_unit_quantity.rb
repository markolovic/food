class ChangeQuantityAttributeForUnitQuantity < ActiveRecord::Migration
  def change
    rename_column :items, :quantity, :unit_quantity
  end
end
