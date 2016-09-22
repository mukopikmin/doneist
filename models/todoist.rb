require 'rest-client'
require 'json'
require 'securerandom'
require 'sinatra/reloader'

class Todoist

  def initialize front_app
    @entrypoint = 'https://todoist.com/API/v7'
    @client_id = ENV['TODOIST_CLIENT_ID']
    @client_secret = ENV['TODOIST_CLIENT_SECRET']
    @scope = 'data:read'
    @front_app = front_app
  end

  def todoist_config
    {
      client_id: @client_id,
      scope: @scope,
      state: SecureRandom.base64(32)
    }
  end

  def authorized code, state
    params = {
      client_id: @client_id,
      client_secret: @client_secret,
      code: code,
      redirect_uri: @front_app
    }
    response = RestClient.post 'https://todoist.com/oauth/access_token', params
    JSON.parse response
  end

  def get_all_projects token
    params = {
      token: token,
      sync_token: '*',
      resource_types: '["projects"]'
    }
    response = RestClient.post "#{@entrypoint}/sync", params
    JSON.parse response
  end

  def get_all_incompleted_items
    response = RestClient.post "#{@entrypoint}/sync", :token => @token
    JSON.parse response
  end

  def get_all_completed_items seq, token
    params = {
      token: token,
      sync_token: '*',
      resource_types: '["projects"]'
    }
    p params
    response = RestClient.post "#{@entrypoint}/get_all_completed_items", params
    JSON.parse response
  end

  def colors
    [
      '#95ef63',
      '#ff8581',
      '#ffc471',
      '#f9ec75',
      '#a8c8e4',
      '#d2b8a3',
      '#e2a8e4',
      '#cccccc',
      '#fb886e',
      '#ffcc00',
      '#74e8d3',
      '#3bd5fb',
      '#dc4fad',
      '#ac193d',
      '#d24726',
      '#82ba00',
      '#03b3b2',
      '#008299',
      '#5db2ff',
      '#0072c6',
      '#000000',
      '#777777'
    ]
  end

end
