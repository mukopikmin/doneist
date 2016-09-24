require 'rest-client'
require 'json'
require 'securerandom'
require 'sinatra/reloader'

class Todoist

  ENTRYPOINT = 'https://todoist.com'.freeze
  API = 'API/v7'.freeze
  STATUS_NO_CONTENT = 204.freeze
  RESOURCE_TYPES = {
    projects: '["projects"]'
  }.freeze
  SECURITY_CODE_LENGTH = 32.freeze

  def initialize front_app
    @client_id = ENV['TODOIST_CLIENT_ID']
    @client_secret = ENV['TODOIST_CLIENT_SECRET']
    @scope = 'data:read'
    @front_app = front_app
  end

  def config
    {
      client_id: @client_id,
      scope: @scope,
      state: SecureRandom.base64(SECURITY_CODE_LENGTH)
    }
  end

  def authorized code, state
    params = {
      client_id: @client_id,
      client_secret: @client_secret,
      code: code,
      redirect_uri: @front_app
    }
    begin
      JSON.parse RestClient.post("#{ENTRYPOINT}/oauth/access_token", params)
    rescue RestClient::ExceptionWithResponse => e
      JSON.parse e.response, symbolize_names: true
    end
  end

  def revoke_token token
    params = {
      client_id: @client_id,
      client_secret: @client_secret,
      access_token: token
    }
    options = {
      content_type: :json,
      accept: :json
    }
    begin
      url = "#{ENTRYPOINT}/api/access_tokens/revoke"
      RestClient.post url, params.to_json, options
      true
    rescue RestClient::ExceptionWithResponse => e
      JSON.parse e.response, symbolize_names: true
    end
  end

  def get_all_projects token
    params = {
      token: token,
      sync_token: '*',
      resource_types: RESOURCE_TYPES[:projects]
    }
    begin
      url = "#{ENTRYPOINT}/#{API}/sync"
      JSON.parse RestClient.post(url, params)
    rescue RestClient::ExceptionWithResponse => e
      JSON.parse e.response, symbolize_names: true
    end
  end

  def get_all_incompleted_items
    begin
      url = "#{ENTRYPOINT}/#{API}/sync"
      JSON.parse RestClient.post(url, :token => @token)
    rescue RestClient::ExceptionWithResponse => e
      JSON.parse e.response, symbolize_names: true
    end
  end

  def get_all_completed_items seq, token
    params = {
      token: token,
      sync_token: '*',
      resource_types: '["projects"]'
    }
    begin
      url = "#{ENTRYPOINT}/#{API}/get_all_completed_items"
      JSON.parse RestClient.post(url, params)
    rescue RestClient::ExceptionWithResponse => e
      JSON.parse e.response, symbolize_names: true
    end
  end

  def self.colors
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
