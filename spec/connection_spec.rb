require 'spec_helper'

describe Delhivery::Connection do
  context "in production mode" do
    subject { Delhivery::Connection.new({api_key: 'your_api_key_here', production: false}) }

    it "base url is https://staging-express.delhivery.com" do
    end
  end

end
