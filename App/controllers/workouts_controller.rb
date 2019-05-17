class WorkoutsController < ApplicationController

    get '/new' do
        erb :"workouts/new"
    end 

    post '/workouts' do
        if params["workout"] != ""
          @workout = current_user.workouts.create(workout: params[:workout])
          redirect '/workout_list'
        else
          redirect '/new'
        end
    end
    
    get '/workouts/:id' do
        @workout = current_user.workouts.find(params[:id])
        redirect '/workout_list'
      end
      
    get '/workouts/:id/edit' do
        @workout= Item.find(params[:id])
        if current_user.workouts.include?(@workout)
          erb :'/workouts/edit'
        else
          redirect "/workout_list"
        end
      end
    
      patch "/workouts/:id" do
        @workout = current_user.workouts.find(params[:id])
        if params[:item] != ""
          @workout.update(item: params[:item])
          redirect "/workouts/#{@workout.id}"
        else
          redirect "/workouts/#{@workout.id}/edit"
        end
      end

      delete '/workouts/:id/delete' do
        @workout = Workout.find(params[:id])
        if current_user.workouts.include?(@workout)
          @workout.delete
          redirect '/workout_list'
        else
          redirect '/workout_list'
        end
      end
    end 
    
    
    #get '/posts/new' do 
        #checking if they are logged in
       # if !logged_in?
           # redirect '/login' #redirecting them to the login page if they aren't
        #else  
            #"A new post form" #rendering if they are
        #end
   # end 

    #get '/workouts/:id/edit' do 
        #checking if they are logged in
       # if !logged_in?
            #redirect "/login" #redirecting them to the login page if they aren't
        #else  
            #how do I find the post that only the author user is allowed to edit.
          # if  post = current_user.posts.find(params[:id])
            #"An edit post form #{current_user.id} is editing #{post.id}" #rendering if they are
           #else 
           # redirect '/posts'
        #end
    #end 
 
