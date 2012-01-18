require 'sinatra'
require 'erb'
require 'coffee-script'

set :static, true

get '/' do
  erb :index
end

get '/javascript/slides.js' do
  coffee :slides
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
