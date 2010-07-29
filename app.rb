require 'rubygems'
require 'sinatra'
require 'erb'

set :static, true

get '/' do
  erb :index
end

get '/slides' do
  @jpg_url = params[:url]
  erb :slides
end