class AddDiscountToCoupon < ActiveRecord::Migration[6.0]
  def change
    add_column :coupons, :discount, :integer
  end
end
