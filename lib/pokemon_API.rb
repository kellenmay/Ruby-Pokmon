class API
    def self.get_data
        response = RestClient.get('https://pokeapi.co/api/v2/pokemon?limit=251')
        #binding.pry
        pokemon_name = JSON.parse(response)
        pokemon_name.each do |name|
            Name.new(name["name"])
        end
        # binding.pry
    end     
end