require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Deleting measurement types and ingredients'
Ingredient.destroy_all
MeasurementLookup.destroy_all
IngredientList.destroy_all
RecipeTag.destroy_all
Tag.destroy_all
RecipeCategory.destroy_all


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

puts 'Creating recipe categories'
dish_type = RecipeCategory.create(name: 'Dish Type')
cuisine = RecipeCategory.create(name: 'Cuisine')
occasion = RecipeCategory.create(name: 'Occasion')

puts 'Creating recipe tags'

dish_type_tags = ['Starter', 'Main', 'Dessert', 'Snack', 'Breakfast', 'Beverage']
cuisine_tags = ['African', 'American', 'Asian', 'British', 'Chinese', 'Eastern-Europe', 'European', 'French', 'German', 'Greek', 'Indian', 'Italian', 'Japanese', 'Jewish', 'Korean', 'Latin-American', 'Mexican', 'Middle-Eastern', 'Nordic', 'Spanish', 'Thai', 'Vietnamese']
occasion_tags = ['Christmas', 'Weeknight-dinner', 'Comfort-food', 'Easter', 'Prepare-ahead', 'Kid-Friendly', "Valentine's Day", 'Crowd-pleaser', 'Finger-food', 'Halloween', 'On-the-go', 'Spring', 'Summer', 'Autumn', 'Winter', 'Barbecue', 'Oktoberfest']

dish_type_tags.each do |name|
    Tag.create(name: name, recipe_category: dish_type)
end

cuisine_tags.each do |name|
    Tag.create(name: name, recipe_category: cuisine)
end

occasion_tags.each do |name|
    Tag.create(name: name, recipe_category: occasion)
end

puts 'Created!'
