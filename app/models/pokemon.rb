class Pokemon < ActiveRecord::Base 
    has_many :users
end