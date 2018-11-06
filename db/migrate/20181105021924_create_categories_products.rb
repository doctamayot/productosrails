class CreateCategoriesProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_products, :id => false do |t|
      t.references :product
      t.references :category
    end
    
  end 
end
