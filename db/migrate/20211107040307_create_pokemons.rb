class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.integer :pokemonid
      t.string :name
      t.string :type1
      t.string :type2
      t.string :total
      t.string :hp
      t.string :attack
      t.string :defense
      t.string :spattack
      t.string :spdefense
      t.string :speed
      t.string :generation
      t.string :legendary

      t.timestamps
    end
  end
end
