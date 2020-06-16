class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :types
      t.string :abilities
      t.integer :height
      t.integer :weight
      t.integer :hp
      t.integer :speed
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :ranking
      t.string :image

      t.timestamps
    end
  end
end
