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
    
                redirect "/workouts"
            elsif !logged_in?
    
                  flash[:message] = "Your username, email, or password is missing. Please try again."
    
                  redirect '/signup'
            end
        end 

        get '/login' do
            if logged_in?
              redirect '/workout'
            else
              erb :'users/login'
            end
          end

        post "/login" do
            user = User.find_by(usersname: params[:username])
            if user && user.authenticate(params[:password])
              session[:user_id] = user.id
              @user = current_user
        
              flash[:message] = "Welcome Back, #{@user.username}!"
        
              redirect "/workouts"
            else
        
              flash[:message] = "The username and password is incorrect. Please try again."
        
              redirect "/login"
            end
          end

          def logout!
            session.clear
            "You're Logged out"
            redirect '/login'
        end

        get '/workouts' do
            @workouts = current_user.workouts
            erb :'users/workouts'
          end


        

        #get '/users' do
            #"You are logged in as #{session[:email]}"
          #erb :"users/user_profile"
      #end 
  

        #post '/users' do
               #@user = User.new
              # @user.email = params[:email]
              # @user.password = params[:password]
           # if @user.save
              # redirect '/login'
           # else 
              # erb :"users/user_profile"
           # end 
        #end 

        
       

       # get '/users/new' do 
            #checking if they are logged in
         # if !logged_in?
             # redirect '/login' #redirecting them to the login page if they aren't
          # else  
            #  "A new post form" #rendering if they are
          # end
        #end 

        #get '/users/:id/edit' do 
              #checking if they are logged in
           #if !logged_in?
              #redirect "/login" #redirecting them to the login page if they aren't
           #else  
               #how do I find the post that only the author user is allowed to edit.
             # if  user = current_user.users.find(params[:id])
              # "An edit post form #{current_user.id} is editing #{user.id}" #rendering if they are
              # else 
               # redirect '/users'
               #end
            #end 
        #end 
end
