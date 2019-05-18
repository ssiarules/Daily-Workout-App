require 'rack-flash'


class UsersController < ApplicationController
    
      use Rack::Flash
      
       get '/signup' do 
            erb :"users/signup"
       end

    
        get '/signup' do 
           if logged_in?
                redirect '/workout_list'
            else  
                erb :"users/signup"
            end 
        end 

        post '/signup' do
              user = User.new(params)
            if user.save
               session[:user_id] = user.id
    
               flash[:message] = "Welcome #{user.username}!"
    
                redirect "/workout_list"
            elsif !logged_in?
    
                  flash[:message] = "Your username, email, or password is missing. Please try again."
    
                  redirect '/signup'
            end
        end 

        get '/login' do
            if logged_in?
              redirect '/workout_list'
            else
              erb :'users/login'
            end
          end

        post "/login" do
            user = User.find_by(username: params[:username])
            if user && user.authenticate(params[:password])
              session[:user_id] = user.id
              @user = current_user
        
              flash[:message] = "Welcome Back, #{@user.username}!"
        
              redirect "/workout_list"
            else
        
              flash[:message] = "The username and password is incorrect. Please try again."
        
              redirect "/login"
            end
          end

          get '/logout' do
            session.clear
            "You're Logged out"
            redirect '/'
        end

        get '/workout_list' do
            @workouts = current_user.workouts
            erb :'users/workout_list'
          end      
end
