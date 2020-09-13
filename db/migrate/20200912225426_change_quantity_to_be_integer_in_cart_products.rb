class ChangeQuantityToBeIntegerInCartProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :cart_products, :quantity, :integer, using: 'quantity::integer'
  end
end
