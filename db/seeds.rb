# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'JSON'
require 'HTTP'

#pokemon = {}
pokemon = JSON.parse(HTTP.get("https://pokeapi.co/api/v2/pokemon/2").body)

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





