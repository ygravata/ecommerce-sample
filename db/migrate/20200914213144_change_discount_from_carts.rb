class ChangeDiscountFromCarts < ActiveRecord::Migration[6.0]
  def change
    change_column :carts, :discount, :integer, default: 0
  end
end
