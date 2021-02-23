50.times do
    name = Faker::Games::Pokemon.name
    move = Faker::Games::Pokemon.move
    location = Faker::Games::Pokemon.location
    
    Pokemon.create(name: name, move: move, location: location)

end


50.times do
    name = Faker::Name.name
    email = Faker::Internet.email
    password = Faker::Internet.password
    
    User.create(name: name, email: email, password: password)

end



# response = RestClient.get('https://pokeapi.co/api/v2/pokemon?limit=251')
#  pokemon_name = JSON.parse(response)
#     pokemon_name.each do |name|
#         Name.new(name["name"])
# end
