class CreateRecipeTags < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_tags do |t|
      t.string :name
      t.references :recipe, null: false, foreign_key: true
      t.references :recipe_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
