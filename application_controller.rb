require 'bundler'
Bundler.require
require_relative 'models/model.rb'
require 'json'
require 'net/http'


class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
  get '/results' do
    erb :results
  end
  
  post '/results' do
    # #grab user input
    user_term = params[:term]
    user_location = params[:location]
    
    # #define instance variable that will be passed to our results page
    @finalresults = search(user_term, user_location)
    
    # # take the yelp response and sent it to the results page
    erb :results
  
  end
  
end