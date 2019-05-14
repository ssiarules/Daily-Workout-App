class ApplicationController < Sinatra::Base 

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions #this will enable the browser with a cookie 
            set :session_secret, "auth_demo_lv "
    end 


    helpers do 

        def logged_in? 
            !!current_user #double negation - takes an object and converts it from its actual value and it cast it into just a binary value of true or false. 
        end 

        def current_user
            @current_user ||= User.find_by(session[:email]) if session [:email]
        end 

        def login(email, password)
            #check if a user with this email actually exist 
            #if so, set the session 
            user = User.find_by(:email => email)
            if user && user.authenticate(password) #if I find a user has an email and  I can authenticate that user with their password than log them in.
                session[:email] = user.email 
            else  
                redirect '/login'
            end 
            #otherwise
            #return false or redirect 'login'
            #is the user who they clain to be
        end 

        def logout!
            session.clear
            "You're Logged out"
            redirect '/login'
        end 
    end 

end 