class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :name
      t.integer :brand_category_id
      t.integer :status
    end
  end
end
