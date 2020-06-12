# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

require "json"
require "open-uri"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

Dose.destroy_all
Ingredient.destroy_all
json_string = open(url).read

ruby_hash = JSON.parse(json_string)
ruby_hash["drinks"].each do |ingredient_baby_hash|
  Ingredient.create!(name: ingredient_baby_hash["strIngredient1"])
end

# puts "1.Cleaning database..."
# Cocktail.destroy_all

# puts "2.Creating cocktails..."
# sex_on_the_beach = { name: "Sex on the Beach" }
# moscow_mule =  { name: "Moscow Mule" }

# counter = 3
# [ sex_on_the_beach, moscow_mule].each do |attributes|
#   cocktail = Cocktail.create!(attributes)
#   puts "#{counter += 1} - Created #{cocktail.name}"
# end
# puts "#{counter + 1}- Finished!"
