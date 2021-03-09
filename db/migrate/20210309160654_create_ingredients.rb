class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.references :ingredient_list, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.integer :amount
      t.references :measurement_lookup, null: false, foreign_key: true

      t.timestamps
    end
  end
end
