require 'icinga'

describe Icinga::Server do
  before do
    @icinga = Icinga::Server.new
  end

  describe "when initialized" do
    it "should set the default port" do
      @icinga.options[:port].should equal(80)
    end
    it "should set the default host" do
      @icinga.options[:host].should match("localhost")
    end
    it "should set the default remote path" do
      @icinga.options[:remote_path].should match("/icinga/cgi-bin/status.cgi")
    end
  end

  it "should create a connection" do
    @icinga.connection.should be_kind_of(Net::HTTP)
  end

  it "should create a request" do
    @icinga.new_request("/").should be_kind_of(Net::HTTP::Get)
  end

  it "should set basic auth" do
    @icinga.options[:user] = "Foo"
    @icinga.new_request("/").get_fields("Authorization").first.should match(/^Basic\s.*/)
  end
end
