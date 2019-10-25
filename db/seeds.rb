# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
# require 'pry-byebug'


def generateIngredients
  puts "Creating all ingredients..."
  json = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
  data = JSON.parse(json)

  data["drinks"].each do |ingredient|
    new_ingredient = Ingredient.create(name: ingredient["strIngredient1"])
    puts new_ingredient
  end
  puts "Finished generating ingredients."
end

def generateCocktails
  puts "Creating 10 cocktails..."
  10.times do
    json = open("https://www.thecocktaildb.com/api/json/v1/1/random.php").read
    data = JSON.parse(json)
    cocktail = data["drinks"].first
    # binding.pry

    name = cocktail["strDrink"]
    imgurl =  cocktail["strDrinkThumb"]
    # ingredients = cocktail[strIngredient1, strIngredient2, strIngredient3]
    new_cocktail = Cocktail.create(name: name, imgurl: imgurl)
    puts new_cocktail
  end
  puts "Finished generating cocktails."
end

generateIngredients()
generateCocktails()