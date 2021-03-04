class UsersController < ApplicationController
    get '/login' do 
        if !logged_in?
          erb :'users/login'
        else
            redirect "/users/#{current_user.id}"
        end   
      end

    post '/login' do 
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"
        else
            erb :'users/login'
        end
    end

   get "/signup" do 
    if !logged_in?
      erb :'users/new'
    else
        redirect "/users/#{current_user.id}"
    end   
  end

    post '/signup' do 
        user = User.find_by(name: params[:name])
        user_email = User.find_by(email: params[:email])

        if params[:name].blank?  || params[:email].blank? || params[:password].blank?
            flash[:message] = "Seems like you left something blank"
            redirect '/signup'
        elsif  user_email
            flash[:message] = "This account already exists!"
            redirect '/signup'
        else
            new_user = User.new(name: params[:name], email: params[:email], password: params[:password])
            new_user.save
            redirect '/login'
        end
    end

    get '/users/:id' do 
        if !logged_in?
            redirect '/login'
        end

        @user = User.find_by(id: params[:id])
        if !@user.nil? && @user == current_user
            erb :"/users/show"

        else
            redirect '/login'
        end
    end
    

    get '/logout' do 
        logout 
        redirect '/'
    end

    get '/users/:id/edit' do 
        @user = User.find_by(id: params[:id])
        if logged_in? && current_user.id == @user.id
            erb :'users/edit'
        else
            redirect '/login'
        end
    end

    patch "/users/:id" do
        @user = User.find_by(id: params[:id])
        @user.pokemons.clear
        pokemons = params[:user][:pokemons_ids].map do |id|
            Pokemon.find_by_id(id)
        end 
        @user.pokemons << pokemons
        @user.save
        redirect "/users/#{current_user.id}" 
      end 

private 

    def redirect_if_not_authorized
        if @pokemon.creator_id != current_user.id 
            flash[:message] = "You can't edit a post you haven't created"
            redirect '/pokemons'
        end
    end
end