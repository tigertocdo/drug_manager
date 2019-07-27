class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.text :option_name
      t.text :ingredient
      t.text :pack
      t.integer :quantity
      t.decimal :price
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
