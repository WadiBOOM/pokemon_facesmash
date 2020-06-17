# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# require 'JSON'
require 'http'
require 'open-uri'

Pokemon.destroy_all

puts "pokemon all destroyed #miskine"

# name
# pokemon["name"]

# Types
# pokemon["types"][0]["type"]["name"]
# several types de check out depending on the number of elements in pokemon["types"] array

# abilities
# pokemon["abilities"][0]["ability"]["name"]
# several types de check out depending on the number of elements in pokemon["abilities"] array

# Height in meters
# pokemon["height"]

# Weight /10 for kg
# pokemon["weight"]

# Stats - hp, attack, defense, special_attack, special_defense, speed
# pokemon["stats"][0]["base_stat"]
# check array

# images
# https://pokeres.bastionbot.org/images/pokemon/1.png

for i in (1..151) do

  pokemon_info = JSON.parse(HTTP.get("https://pokeapi.co/api/v2/pokemon/#{i}").body)
  file = URI.open("https://pokeres.bastionbot.org/images/pokemon/#{i}.png")

  ranking = i

  name = pokemon_info["name"]

  types = []
  pokemon_info["types"].each do |n|
    types << n["type"]["name"]
  end

  abilities = []
  pokemon_info["abilities"].each do |n|
    abilities << n["ability"]["name"]
  end

  height = pokemon_info["height"] * 100

  weight = pokemon_info["weight"] / 10

  # stats
  hp = pokemon_info["stats"][0]["base_stat"]
  attack = pokemon_info["stats"][1]["base_stat"]
  defense = pokemon_info["stats"][2]["base_stat"]
  special_attack = pokemon_info["stats"][3]["base_stat"]
  special_defense = pokemon_info["stats"][4]["base_stat"]
  speed = pokemon_info["stats"][5]["base_stat"]

  pokemon = Pokemon.new(ranking: ranking,
                        name: name,
                        types: types,
                        abilities: abilities,
                        height: height,
                        weight: weight,
                        hp: hp,
                        attack: attack,
                        defense: defense,
                        special_attack: special_attack,
                        special_defense: special_defense,
                        speed: speed
                        )
  pokemon.photo.attach(io: file, filename: "#{i}.png", content_type: 'image/png')
  pokemon.save!

  puts "Pokemon #{i} - #{name} created ! #TeamRocket"

end
