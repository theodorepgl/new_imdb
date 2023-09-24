require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'

require_relative 'models/movie'
# require_relative 'models/review'
# require_relative 'models/user'
# require_relative 'models/cast'


get '/' do 
	@movies = Movie.take(12)
	erb :index
end

get '/login' do
	erb :login
end

get '/signup' do 
	erb :signup
end

post '/signup' do
	erb :movies
end

get '/logout' do 
	erb :logout
end

get '/movies' do
	erb :movie	
end