class SessionsController < ApplicationController

    get '/login' do 
        erb :"sessions/login.html"
    end 

    #this post route will processing the login 
    post '/sessions' do
         #login a user with this email and passwor
        login(params[:email], params[:password])
         redirect '/posts'
    end 

    get '/logout' do 
        logout!
    end 
end 