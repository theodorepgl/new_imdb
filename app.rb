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

get '/movies' do
	@movies = Movie.all
	erb :movies
end

get '/movies/:movie_id' do  # movie details
	@movie = Movie.find(params[:movie_id])
	erb :movie
end

post '/movies/:movie_id' do
 	@movie = Movie.find(params[:movie_id])
 	erb :review
end
#------------Reviews------------------

get '/movies/add_review/:movie_id' do
	@movie = current_user.movies.find(params[:movie_id])
	erb :review
end

post '/movies/add_review/:movie_id' do
	@movie = Movie.find(params[:movie_id])
	@review = current_user.reviews.create(movie_id: params[:movie_id], content: params[:content], score: params[:score])
	if @review.save
		redirect "/movies/#{@movie.id}"
	else
		erb :review
	end
end
