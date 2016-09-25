require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe :Todoist do

  def app
    @app ||= Sinatra::Application
  end

  before do
    @test_token = ENV['TODOIST_TEST_TOKEN']
    @illegal_token = 'thisisillegaltoken'
  end

  describe "/api" do

    describe "/config" do
      before { get "/api/config" }
      subject { last_response }
      let(:config) { JSON.parse last_response.body, symbolize_names: true }

      it "returns ok" do
        is_expected.to be_ok
      end

      it "returns Hash" do
        expect(config).to be_kind_of Hash
      end

      it "has correct format" do
        expect(config[:client_id]).to be_kind_of String
        expect(config[:scope]).to be_kind_of String
        expect(config[:state]).to be_kind_of String
      end
    end

    xdescribe "/revoke_token" do
      context "with correct token" do
        before { get "/api/revoke_token?token=#{@test_token}" }
        subject { last_response }
        let(:config) { JSON.parse last_response.body, symbolize_names: true }

        it "returns ok" do
          is_expected.to be_ok
        end
      end

      context "with illegal token" do
        before { get "/api/revoke_token?token=#{@illegal_token}" }
        subject { last_response.status }
        let(:config) { JSON.parse last_response.body, symbolize_names: true }

        it "returns 403" do
          is_expected.to eq 403
        end
      end
    end

    xdescribe "/token_exchange" do
      context "exchange success" do

      end

      context "exchange fail" do

      end
    end

    describe "/completed" do
      context "with correct token" do
        before { get "/api/projects?token=#{@test_token}" }
        subject { last_response }
        let(:body) { JSON.parse last_response.body, symbolize_names: true }

        it "returns ok" do
          is_expected.to be_ok
        end

        it "returns Hash" do
          expect(body).to be_kind_of Hash
        end
      end

      context "with illegal token" do
        before { get "/api/projects?token=#{@illegal_token}" }
        subject { last_response.status }
        let(:body) { JSON.parse last_response.body, symbolize_names: true }

        it "returns 403" do
          is_expected.to eq 403
        end

        it "returns Hash" do
          expect(body).to be_kind_of Hash
        end
      end
    end

    describe "/projects" do
      context "with correct token" do
        before { get "/api/projects?token=#{@test_token}" }
        subject { last_response }
        let(:body) { JSON.parse last_response.body, symbolize_names: true }

        it "returns ok" do
          is_expected.to be_ok
        end

        it "returns Hash" do
          expect(body).to be_kind_of Hash
        end
      end

      context "with illegal token" do
        before { get "/api/projects?token=#{@illegal_token}" }
        subject { last_response.status }
        let(:body) { JSON.parse last_response.body, symbolize_names: true }

        it "returns 403" do
          is_expected.to eq 403
        end

        it "returns Hash" do
          expect(body).to be_kind_of Hash
        end
      end
    end

    describe "/user" do
      context "with correct token" do
        before { get "/api/user?token=#{@test_token}" }
        subject { last_response }
        let(:response) { JSON.parse last_response.body, symbolize_names: true }

        it "returns ok" do
          is_expected.to be_ok
        end

        it "returns Hash" do
          expect(body).to be_kind_of Hash
        end
      end

      context "with illegal token" do
        before { get "/api/user?token=#{@illegal_token}" }
        subject { last_response }
        let(:response) { JSON.parse last_response.body, symbolize_names: true }

        it "returns 403" do
          is_expected.to eq 403
        end

        it "returns Hash" do
          expect(body).to be_kind_of Hash
        end
      end
    end

    describe "/colors" do
      before { get "/api/colors" }
      subject { last_response }
      let(:body) { JSON.parse last_response.body, symbolize_names: true }

      it "returns ok" do
        is_expected.to be_ok
      end

      it "returns Array" do
        expect(body).to be_kind_of Array
      end

      it "include color code" do
        expect(body.first).to match /#.*/
      end
    end
  end
end
