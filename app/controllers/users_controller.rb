class UsersController < ApplicationController

    # responsible for anything involving our user

    get '/signup' do # render signup form
        erb :"UsersController/signup"
    end 

    post '/signup' do # process the signup form
        # receive data from the form inside of params hash
        # create a new user object with the data
        user = User.new(params)
        # validate our user object
        # if user.email != ""
        if user.email.blank? || user.email.blank? || user.name.blank? || user.password.blank? || user.find_by_email(params[:email]) || User.find_by_email(params[:email])
            redirect '/signup'
        else 
            user.save
            session[:author_id] = user.id # logging user in
            redirect '/pokemons'
        end 
    end 


    # login '/login' read => querying our user and reading UsersController attributes

    get '/login' do # render the login form
        erb :"users/login"
    end 

    post '/login' do # process the login form
        # gather data from the form => params
        # find my user object
        @user = User.find_by(email: params[:email])
        # binding.pry
        # if user exists && password is correct
        if @user && @user.authenticate(params[:password])
            # login user
            session[:user_id] = @user.id
            # redirect 
            redirect "/users/#{@user.name}"
        else 
            # flash[]
            # flash[:error] = "Invalid login"
            # invalid login
            redirect '/login'
        end 
    end 

    get '/users/:name' do 
        if !logged_in?
            redirect '/login'
        end

        
        @user = User.find_by(name: params[:name])
        if !@user.nil? && @user == current_user
            erb :'users/show'
        else
            redirect '/login'
        end

    end


    #clears session hash 
    get '/logout' do
        session.clear
        redirect '/login'
    end 

    
end 