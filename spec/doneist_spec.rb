require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe :Todoist do

  def app
    @app ||= Sinatra::Application
  end

  # describe "/api" do
  #
  #   describe "/projects" do
  #
  #     before { get "/api/projects" }
  #     subject { last_response }
  #     let(:body) { JSON.parse last_response.body, symbolize_names: true }
  #
  #     it "returns 200 OK" do
  #       is_expected.to be_ok
  #     end
  #
  #     it "returns Hash" do
  #       expect(body).to be_kind_of(Hash)
  #     end
  #   end
  # end
end
