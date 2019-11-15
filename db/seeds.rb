# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Cocktail.all.destroy
Ingredient.all.destroy
require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingrdient_serialized = open(url).read
ingredients = JSON.parse(ingrdient_serialized)

ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

url2 = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list'
cocktails_serialized = open(url2).read
cocktails = JSON.parse(cocktails_serialized)

cocktails["drinks"].each do |cocktail|
  Cocktail.create(name: cocktail["strCategory"])
end
