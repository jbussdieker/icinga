require 'icinga'

describe Icinga::Responder do
  before do
    @client = Icinga::Client.new
    @responder = Icinga::Responder.new(Icinga::Object, @client, @client.new_request(""))
  end

  it "should create a response" do
    @responder.response.should respond_to(:message)
  end
end
