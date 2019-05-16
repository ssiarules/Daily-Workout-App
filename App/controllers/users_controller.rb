class UsersController < ApplicationController
    get '/signup' do 
        if logged_in?
            redirect 
        erb :"users/new.html"
    end 

    post '/users' do
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
        if @user.save
            redirect '/login'
        else 
            erb :"users/new.html"
    end 
 end 

 get '/users' do
    #"You are logged in as #{session[:email]}"
    erb :"users/user_profile.html"
end 

get '/users/new' do 
    #checking if they are logged in
    if !logged_in?
        redirect '/login' #redirecting them to the login page if they aren't
    else  
        "A new post form" #rendering if they are
    end
end 

get '/users/:id/edit' do 
    #checking if they are logged in
    if !logged_in?
        redirect "/login" #redirecting them to the login page if they aren't
    else  
        #how do I find the post that only the author user is allowed to edit.
       if  user = current_user.users.find(params[:id])
        "An edit post form #{current_user.id} is editing #{user.id}" #rendering if they are
       else 
        redirect '/users'
    end
   end 
  end 
end
end  