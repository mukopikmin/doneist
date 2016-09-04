require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe :Todoist do

  before do
    @todoist = Todoist.new
  end

  describe "#auth" do

  end

  describe "#get_all_projects" do

    subject { @todoist.get_all_projects }

    it "returns Hash" do
      is_expected.to be_kind_of Hash
    end
  end

  describe "#get_all_incompleted_items" do

  end

  describe ".colors" do
    
  end
end
