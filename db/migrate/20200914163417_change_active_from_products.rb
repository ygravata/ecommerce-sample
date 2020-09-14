class ChangeActiveFromProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :active, 'boolean USING CAST(active AS boolean)'
  end
end
