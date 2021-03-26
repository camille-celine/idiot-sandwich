require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Deleting measurement types and ingredients'
MeasurementLookup.destroy_all
IngredientList.destroy_all

puts 'Creating 10 measurement types...'
10.times do 
    measurement_type = MeasurementLookup.new(
        measurement_type: Faker::Food.metric_measurement
    )
    measurement_type.save!
end
puts 'Created!'

puts 'Creating 100 ingredients...'
100.times do
    ingredient = IngredientList.new(
        name: Faker::Food.ingredient 
    )
    ingredient.save!
end
puts 'Created!'
