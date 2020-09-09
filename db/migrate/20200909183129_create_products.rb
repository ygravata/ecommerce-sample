class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :category
      t.string :image_url
      t.text :for
      t.text :desc1
      t.text :desc2
      t.string :specs_name
      t.string :specs_desc
      t.string :text
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
