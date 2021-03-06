class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :location
      t.string :move
      t.belongs_to :user
  end
end
end