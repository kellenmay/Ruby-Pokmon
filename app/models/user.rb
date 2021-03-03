class User < ActiveRecord::Base 
    has_many :pokemons
    has_secure_password

# takes column from table and turns it into an array
    serialize :pokemon, Array

end