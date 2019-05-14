class SessionsController < ApplicationController

    get '/' do 
       erb :"sessions/homepage.html"
    end 

    post '/signup' do 
        erb :"users/new.html"

    end 
    
    get '/login' do 
        erb :"sessions/login.html"
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