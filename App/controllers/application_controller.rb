require './config/environment'


class ApplicationController < Sinatra::Base 

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions #this will enable the browser with a cookie 
            set :session_secret, "super_secret "
    end 

    before do
        pass if ["login", "signup", nil].include? request.path_info.split('/')[1]
        if !logged_in?
          redirect '/'
        end
     end
 
     get '/' do 
        erb :"users/homepage"
    end 


        
    helpers do 

        def logged_in? 
            !!current_user #double negation - takes an object and converts it from its actual value and it cast it into just a binary value of true or false. 
        end 

        def current_user
            @current_user ||= User.find(session[:user_id]) if session [:user_id]
        end 
        
        #def login(email, password)
            #check if a user with this email actually exist 
            #if so, set the session 
           # user = User.find_by(:email => email)
            #if user && user.authenticate(password) #if I find a user has an email and  I can authenticate that user with their password than log them in.
                #session[:email] = user.email 
           # else  
               # redirect '/login'
            #end 
            #otherwise
            #return false or redirect 'login'
            #is the user who they clain to be
        #end
         

        
    end 
end  
