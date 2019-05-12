class PostsController < ApplicationController

    get '/posts' do
        #"You are logged in as #{session[:email]}"
        "You're Logged In!"
    end 

    get '/posts/new' do 
        #checking if they are logged in
        if !logged_in?
            redirect "/login" #redirecting them to the login page if they aren't
        else  
            "A new post form" #rendering if they are
        end
    end 

    get '/posts/:id/edit' do 
        #checking if they are logged in
        if !logged_in?
            redirect "/login" #redirecting them to the login page if they aren't
        else  
            #how do I find the post that only the author user is allowed to edit.
           if  post = current_user.posts.find(params[:id])
            "An edit post form #{current_user.id} is editing #{post.id}" #rendering if they are
           else 
            redirect '/posts'
        end
    end 

end 