class AddPokemonsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pokemon, :text
  end
end
