require 'uri'
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/json'
require 'sinatra/cross_origin'
require './models/todoist'

unless ENV['BASICAUTH_USER'].nil?
  use Rack::Auth::Basic do |username, password|
    username == ENV['BASICAUTH_USER'] && password == ENV['BASICAUTH_PASSWORD']
  end
end

configure do
  enable :cross_origin
end

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/api/incompleted' do

end

get '/api/completed/:seq' do
  todoist = Todoist.new
  json todoist.get_all_completed_items params[:seq]
end

get '/api/projects' do
  todoist = Todoist.new
  json todoist.get_all_projects
end

get '/api/colors' do
  json Todoist.colors
end
