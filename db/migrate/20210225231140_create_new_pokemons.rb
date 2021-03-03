  class CreateNewPokemons < ActiveRecord::Migration[5.2]
    def change
      create_table :newpokemons do |t|
        t.string :name
        t.string :location
        t.string :move
        t.belongs_to :user
        t.belongs_to :pokemon
    end
  end
  end
