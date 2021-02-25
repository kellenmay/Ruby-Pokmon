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


       get '/pokemons/:id' do 
          get_pokemon
           erb :'pokemons/show'


       post '/pokemons' do 
           # create the new pokemon
           # redirect our user somewhere 
       
           #don't use create
           @pokemon = Pokemon.new(params[:pokemon])
           @pokemon.user_id = session[:user_id]
           @pokemon.save

           redirect "/pokemons/#{@pokemon.id}" 
       end 
   

       get '/pokemons/:id/edit' do 
           get_pokemon
           redirect_if_not_userized
           erb :"/pokemons/edit"
       end 
   

       patch '/pokemons/:id' do 
           get_pokemon
           redirect_if_not_userized
           @pokemon.update(title: params[:title], content: params[:content])
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
           if @pokemon.user != current_user
               flash[:error] = "You cant make this edit, you don't own this"
               redirect '/pokemons'
           end 
   
       end 
   
   end 