class CreateMeasurementLookups < ActiveRecord::Migration[6.0]
  def change
    create_table :measurement_lookups do |t|
      t.string :unit
      t.string :measurement_type

      t.timestamps
    end
  end
end
