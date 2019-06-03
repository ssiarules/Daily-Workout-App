# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
gem 'sinatra'
gem 'sqlite3'
gem 'activerecord', :require => "active_record"
gem 'rake'
gem 'pry'
gem 'sinatra-activerecord'
gem 'require_all'  #helps load dependencies 
gem 'shotgun'
gem 'sinatra-redirect-with-flash'
gem 'bcrypt', '~> 3.1.7'
gem 'rack-flash3'
gem 'tux'


group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
  
end
