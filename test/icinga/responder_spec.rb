require 'icinga'

describe Icinga::Responder do
  before do
    @server = Icinga::Server.new
    @responder = Icinga::Responder.new(@server, @server.new_request(""))
  end

  it "should create a response" do
    @responder.response.should be_kind_of(Net::HTTPResponse)
  end

  it "should respond to data with parsed data" do
    @responder.data.should be_kind_of(Hash)
  end

  it "should respond to data with error info" do
    @responder.data[:error].should be_kind_of(String)
  end

  it "should respond with empty string for bad connection/request" do
    @responder.to_s.should match("")
  end
end
