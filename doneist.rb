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
end

before do
  @front_app = 'http://localhost:9000/#'
  @todoist = Todoist.new @front_app
end

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

namespace '/api' do

  get '/auth' do
    @todoist.auth
  end

  get '/auth_config' do
    json @todoist.todoist_config
  end

  get '/authorized' do
    token = @todoist.authorized(params[:code], params[:state])
    redirect to "#{@front_app}/authorized?token=#{token['access_token']}"
  end

  get '/incompleted' do

  end

  get '/completed/:seq' do
    json @todoist.get_all_completed_items(params[:seq], params[:token])
  end

  get '/projects' do
    json @todoist.get_all_projects(params[:token])
  end

  get '/colors' do
    json @todoist.colors
  end
end
