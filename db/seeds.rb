# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

###### Seed Head ##########

require 'JSON'
require 'http'
require 'open-uri'

Pokemon.destroy_all

puts "pokemon all destroyed #miskine"

###########################

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

######### Seed Body ###########

OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

for i in (1..151) do
  sleep(5)
  pokemon_info = JSON.parse(HTTP.get("https://pokeapi.co/api/v2/pokemon/#{i}").body)
  sprite_file = URI.open("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{i}.png")
  image_file = URI.open("https://pokeres.bastionbot.org/images/pokemon/#{i}.png")

  ranking = i

  name = pokemon_info["name"]

  types = ""
  pokemon_info["types"][0...-1].each do |n|
    types += n["type"]["name"] + ","
  end
  types += pokemon_info["types"][-1]["type"]["name"]

  abilities = ""
  pokemon_info["abilities"][0...-1].each do |n|
    abilities += n["ability"]["name"] + ","
  end
  abilities += pokemon_info["abilities"][-1]["ability"]["name"]

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
  pokemon.photos.attach(io: sprite_file, filename: "#{i}_sprite.png", content_type: 'images/png')
  pokemon.photos.attach(io: image_file, filename: "#{i}_image.png", content_type: 'images/png')
  pokemon.save!

  puts "Pokemon #{i} - #{name} created ! #TeamRocket"

end

############################################
