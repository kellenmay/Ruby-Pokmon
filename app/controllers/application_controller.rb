class ApplicationController < Sinatra::Base
    
  configure do 
      # set sessions
      set :views, 'app/views'
      enable :sessions 
      set :session_secret, "secret"
      register Sinatra::Flash
  end 

  # define general routes
  # any route/request that doesnt involve a model 
  get '/' do 
    erb :welcome
  end 

  helpers do

   def current_user
    @current_user ||= User.find_by_id(session[:user_id])
   end 


    def logged_in?
      !!session[:user_id]
    end 

  end 

  # about route
  # contact page

end 