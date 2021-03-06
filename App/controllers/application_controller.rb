require './config/environment'


class ApplicationController < Sinatra::Base 

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions #this will enable the browser with a cookie 
            set :session_secret, "super_secret "
    end 

    #Main Page
    get '/' do 
        erb :"users/homepage"
    end 

  
    helpers do 

        def logged_in? 
            !!session[:user_id]  #double negation - takes an object and converts it from its actual value and it cast it into just a binary value of true or false. 
        end 

        def current_user
            User.find_by_id(session[:user_id]) 
        end
        
    end 
end  
