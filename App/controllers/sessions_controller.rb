class SessionsController < ApplicationController

    get '/' do 
       erb :"sessions/homepage.html"
    end 

    get '/signup' do 
        erb :"sessions/signup"
    end 

    post '/signup' do 
        erb :"users/signup.html"
    end 
    
    get '/login' do 
        erb :"sessions/login"
    end 

    #this post route will processing the login 
    post '/sessions' do
         #login a user with this email and password
        login(params[:email], params[:password])
         redirect '/posts'
    end 

    get '/logout' do 
        logout!
    end 
end 