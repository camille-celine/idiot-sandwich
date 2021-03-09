class CreateInstructions < ActiveRecord::Migration[6.0]
  def change
    create_table :instructions do |t|
      t.integer :step_number
      t.text :intruction_text
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
