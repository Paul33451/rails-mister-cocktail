require 'json'
require 'open-uri'

Cocktail.destroy_all
Ingredient.destroy_all

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
