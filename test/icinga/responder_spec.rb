require 'icinga'

describe Icinga::Responder do
  before do
    @server = Icinga::Server.new
    @responder = Icinga::Responder.new(Icinga::Object, @server, @server.new_request(""))
  end

  it "should create a response" do
    @responder.response.should respond_to(:message)
  end
end
