require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe :Todoist do

  before do
    @front_app = 'http://doneist.sample.com'
    @client_id = ENV['TODOIST_CLIENT_ID']
    @client_secret = ENV['TODOIST_CLIENT_SECRET']
    @todoist = Todoist.new @client_id, @client_secret, @front_app
    @test_token = ENV['TODOIST_TEST_TOKEN']
    @illegal_token = 'thisisileegaltoken'
  end

  describe "#config" do
    let(:config) { @todoist.config }

    it "returns Hash" do
      expect(config).to be_kind_of Hash
    end

    it "returns Hash in specified format" do
      expect(config[:client_id]).to eq @client_id
      expect(config[:scope]).to eq 'data:read'
      expect(config[:state]).to be_kind_of String
    end
  end

  xdescribe "#token_exchange" do
    context "with correct token" do
      let(:credentials) { @todoist.token_exchange @code, @state }

      it "returns Hash in specified format" do
        expect(credentials).to be_kind_of Hash
        expect(credentials[:access_token]).to be_kind_of String
        expect(credentials[:token_type]).to be_kind_of String
      end
    end

    context "with illegal token" do
      it "raises exception" do
        expect(@todoist.token_exchange @code, @state).to raise_exception
      end
    end
  end

  describe "#revoke_token" do
    xcontext "with correct token" do
      let(:result) { @todoist.revoke_token @test_token }

      it "returns Hash" do
        expect(result).to be_kind_of Hash
      end

      it "contains message ok" do
        expect(result[:result]).to eq 'ok'
      end
    end

    context "with illegal token" do
      it "raises exception" do
        expect {
          @todoist.revoke_token @illegal_token
      }.to raise_exception
      end
    end
  end

  describe "#projects" do
    context "with correct token" do
      let(:response) { @todoist.projects @test_token }

      it "returns Hash in specified format" do
        expect(response).to be_kind_of Hash
        expect(response[:projects]).to be_kind_of Array
      end
    end

    context "with illegal token" do
      it "raises exception" do
        expect {
          @todoist.projects @illegal_token
        }.to raise_exception
      end
    end
  end

  describe "#completed_items" do
    context "with correct token" do
      let(:response) { @todoist.completed_items @test_token }

      it "returns Hash in specified format" do
        expect(response).to be_kind_of Hash
        expect(response[:items]).to be_kind_of Array
        expect(response[:projects]).to be_kind_of Hash
      end
    end

    context "with illegal token" do
      it "raises exception" do
        expect {
          @todoist.completed_items @illegal_token
        }.to raise_exception
      end
    end
  end

  describe "#user" do
    context "with correct token" do
      let(:response) { @todoist.user @test_token }

      it "return user in specified format" do
        expect(response).to be_kind_of Hash
      end
    end

    context "with illegal token" do
      it "raises exception" do
        expect {
          @todoist.user @illegal_token
        }.to raise_exception
      end
    end
  end

  describe ".resource_types" do
    subject { Todoist.resource_types :all }

    it "return specified format string" do
      is_expected.to eq '["all"]'
    end
  end

  describe ".colors" do
    let(:colors) { Todoist.colors }

    it "returns Array" do
      expect(colors).to be_kind_of Array
    end

    it "contains color code" do
      expect(colors.first).to match /#.*/
    end
  end
end
