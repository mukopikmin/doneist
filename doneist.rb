require 'uri'
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/json'
require 'sinatra/namespace'
require 'sinatra/cross_origin'
require 'sinatra/cookies'
require './models/todoist'

register Sinatra::Namespace

configure do
  enable :cross_origin
  set :allow_methods, [:get, :post, :options]
end

before do
  client_id = ENV['TODOIST_CLIENT_ID']
  client_secret = ENV['TODOIST_CLIENT_SECRET']
  @front_app = ENV['APP_URI'] || 'http://localhost:4567/#'
  @todoist = Todoist.new client_id, client_secret, @front_app
end

options "*" do
  response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
  200
end

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

namespace '/api' do

  get '/config' do
    json @todoist.config
  end

  post '/revoke_token' do
    payload = JSON.parse request.body.read, :symbolize_names => true
    json @todoist.revoke_token(payload[:token])
  end

  get '/token_exchange' do
    token = @todoist.token_exchange(params[:code], params[:state])
    redirect to "#{@front_app}/authorized?token=#{token[:access_token]}"
  end

  get '/completed' do
    json @todoist.completed_items(params[:token])
  end

  get '/projects' do
    json @todoist.projects(params[:token])
  end

  get '/colors' do
    json Todoist.colors
  end
end
