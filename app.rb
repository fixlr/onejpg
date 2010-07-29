require 'rubygems'
require 'sinatra'
require 'erb'

set :static, true

get '/' do
  erb :index
end

get '/slides' do
  redirect '/' unless params[:url]
  begin
    @jpg_url, @position = params[:url].match(/(https?\:\/\/.+?)\/([\d]+)\.jpg/).captures
    erb :slides
  rescue NoMethodError
    redirect '/'
  end
end