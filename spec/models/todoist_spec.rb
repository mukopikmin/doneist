require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe :Todoist do

  before do
    @front_app = 'http://doneist.sample.com'
    @todoist = Todoist.new @front_app
    @client_id = ENV['TODOIST_CLIENT_ID']
    @client_secret = ENV['TODOIST_CLIENT_SECRET']
    @test_token = ENV['TODOIST_TEST_TOKEN']
    @code = ENV['CODE']
    @state = 'thisisteststate'
  end

  describe "#config" do
    let(:config) { @todoist.config }

    it "returns Hash" do
      expect(config).to be_kind_of Hash
    end

    it "returns Hash which includes specified keys" do
      expect(config[:client_id]).to be_kind_of String
      expect(config[:scope]).to eq 'data:read'
      expect(config[:state]).to be_kind_of String
    end
  end

  # describe "#authorized" do
  #   let(:response) { @todoist.authorized @code, @state }
  #
  #   it "returns Hash" do
  #     expect(response).to be_kind_of Hash
  #   end
  #
  #   it "text" do
  #
  #   end
  # end

  describe "#revoke_token" do

    xcontext "revoke success" do
      let(:result) { @todoist.revoke_token @test_token }

      it "returns true" do
        expect(result).to be true
      end
    end

    context "revole failed" do
      let(:result) { @todoist.revoke_token 'illegal_access_token' }

      it "contains error message" do
        expect(result[:error]).to be_kind_of String
      end
    end
  end

  describe "#get_all_projects" do

    context "with correct token" do
      subject { @todoist.get_all_projects @test_token }

      it "returns Hash" do
        is_expected.to be_kind_of Hash
      end
    end

    context "with illegal token" do
      subject { @todoist.get_all_projects('illegal_tl
        oken')[:error] }

      it "returns error message" do
        is_expected.to be_kind_of String
      end
    end
  end

  describe "#get_all_incompleted_items" do

    context "with correct token" do
      subject { @todoist.get_all_incompleted_items @test_token }

      it "returns Hash" do
        is_expected.to be_kind_of Hash
      end
    end

    context "with illegal token" do
      subject { @todoist.get_all_projects('illegal_tl
        oken')[:error] }

      it "returns error message" do
        is_expected.to be_kind_of String
      end
    end
  end

  describe "#get_all_completed_items" do

    context "with correct token" do
      subject { @todoist.get_all_completed_items @test_token }

      it "returns Hash" do
        is_expected.to be_kind_of Hash
      end
    end

    context "with illegal token" do
      subject { @todoist.get_all_projects('illegal_tl
        oken')[:error] }

      it "returns error message" do
        is_expected.to be_kind_of String
      end
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
