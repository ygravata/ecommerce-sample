class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.string :coupon_code
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
