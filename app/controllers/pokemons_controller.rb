class PokemonsController < ApplicationController
    # all routes pertaining to Pokemon model 
   
       # ERB tags: 
       # <%= %> = what our user sees
       # <% %> = what our views process
   
       # user just requested all pokemons 
       #index route
       get '/pokemons' do 
           @pokemons = Pokemon.all
           erb :'pokemons/index'
       end 
   
       # user just made a request to view form to add a new pokemon
       get '/pokemons/new' do 
        if !logged_in?
            redirect '/login'
        else    
            erb :'pokemons/new'
        end
       end 
   
       # show route
       get '/pokemons/:id' do 
          get_pokemon
           erb :'pokemons/show'
           # # retrieve the requested pokemon 
           # @pokemon = Pokemon.find(params[:id])
           # # show details of that pokemon         
           # erb :'pokemons/show'
       end 
   
       # user wants to see details of 1 pokemon
       # show route
   
       # our user just submitted the new pokemon form 
       post '/pokemons' do 
           # create the new pokemon
           # redirect our user somewhere 
   
           @pokemon = Pokemon.new(params[:pokemon]) #.new & .save
           @pokemon.user_id = session[:user_id]
           @pokemon.save

           redirect "/pokemons/#{@pokemon.id}" 
       end 
   
       # our user just requested to see an edit form for a pokemon
   
       get '/pokemons/:id/edit' do 
           get_pokemon
           redirect_if_not_userized
           erb :"/pokemons/edit"
           # retreive the object
           # autofill a form with the details of that object
           # render to our user to fill out 
       end 
   
       # user just submitted the edit form
       patch '/pokemons/:id' do 
           get_pokemon
           redirect_if_not_userized
           @pokemon.update(title: params[:title], content: params[:content])
           redirect "/pokemons/#{@pokemon.id}" 
           # @pokemon.update
           # no view 
           # update the particular object with new attributes
       end 
   
       # user wants to delete an existing pokemon 
       delete '/pokemons/:id' do 
           get_pokemon
           @pokemon.destroy
           redirect '/pokemons'
           # no view 
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