class PokemonsController < ApplicationController

       get '/pokemons' do 
           @pokemons = Pokemon.all
           erb :'pokemons/index'
       end 


       get '/pokemons/new' do 
        if !logged_in?
            redirect '/login'
        else    
            erb :'pokemons/new'
        end
       end 
       
       post '/pokemons' do 
           #don't use create
           @pokemon = Pokemon.new(params[:pokemon])
           @pokemon.user_id = session[:user_id]
           @pokemon.save

           redirect "/pokemons/#{@pokemon.id}" 
       end 

       get '/pokemons/:id' do 
          get_pokemon
           erb :'pokemons/show'
       end

       get '/pokemons/:id/edit' do 
        
           get_pokemon
           redirect_if_not_userized
            erb :'pokemons/edit'
       end 
   

       patch '/pokemons/:id' do 
           get_pokemon
           redirect_if_not_userized
           @pokemon.update(name: params[:name], move: params[:move], location: params[:location])
           redirect "/pokemons/#{@pokemon.id}" 
       end 
   

       delete '/pokemons/:id' do 
           get_pokemon
           @pokemon.destroy
           redirect '/pokemons'
       end 
   
   private 
   
       def get_pokemon 
           @pokemon = Pokemon.find_by(id:params[:id])
       end 
   
       def redirect_if_not_userized
           if @pokemon.user_id != current_user.id
               flash[:error] = "Hey! These aren't yours!"
            redirect '/pokemons'
           end 
   
       end 
   
end