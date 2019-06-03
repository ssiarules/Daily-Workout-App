class WorkoutsController < ApplicationController

  configure do
    enable :sessions
    set :session_secret, "super_secret "
  end

    get '/new' do
        erb :"workouts/new"
    end 

    post '/workouts' do
        if params["workout"] != "" #The not-equal-to operator (!=) returns true if the operands do not have the same value; otherwise, it returns false.
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
        @workout= Workout.find(params[:id])
        if current_user.workouts.include?(@workout)
          erb :'/workouts/edit'
        else
          redirect "/workout_list"
        end
      end
    
      patch "/workouts/:id" do
        @workout = current_user.workouts.find(params[:id])
        if params[:workout] != ""
          @workout.update(workout: params[:workout])
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
    
    
    
   
 
