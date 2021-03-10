class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.integer :cooking_time
      t.integer :difficulty
      t.integer :serving
      t.integer :min_serving_size
      t.boolean :is_public
      t.references :user, null: false, foreign_key: true
      t.integer :prep_time

      t.timestamps
    end
  end
end
