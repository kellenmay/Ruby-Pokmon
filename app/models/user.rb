class User < ActiveRecord::Base 
    has_many :pokemons
    has_secure_password
end