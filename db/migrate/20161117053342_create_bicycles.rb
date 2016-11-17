class CreateBicycles < ActiveRecord::Migration[5.0]
  def change
    create_table :bicycles do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image_link
      t.references :style, foreign_key: true

      t.timestamps
    end
  end
end
