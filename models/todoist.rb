require 'rest-client'
require 'json'

class Todoist

  API = 'https://todoist.com/API/v6'

  def initialize
    @token = ENV['TODOIST_TOKEN']
  end

  def auth
    RestClient.post "#{API}/login_with_google", :token => @token, :seq_no => 0, :resource_types => '["projects"]'

  end

  def get_all_projects
    response = RestClient.post "#{API}/sync", :token => @token, :seq_no => 0, :resource_types => '["projects"]'
    JSON.parse response
  end

  def get_all_incompleted_items
    response = RestClient.post "#{API}/sync", :token => @token
    JSON.parse response
  end

  def get_all_completed_items seq
    params = {
      token: @token,
      since: '2016-04-01T00:00',
      seq_no: seq
    }
    response = RestClient.post "#{API}/get_all_completed_items", params
    JSON.parse response
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
