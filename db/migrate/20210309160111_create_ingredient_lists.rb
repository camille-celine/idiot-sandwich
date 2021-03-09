class CreateIngredientLists < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
