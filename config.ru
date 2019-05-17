require_relative './config/environment'

require './config/environment'

#if ActiveRecord::Migrator.needs_migration?
    #raise 'Migrations are pending. Run 'rake db:migrate' to resolve issue.'
#end 

use Rack::MethodOverride
#use Rack::Session::Cookie
#use SessionsController
use WorkoutsController
use UsersController 
run ApplicationController