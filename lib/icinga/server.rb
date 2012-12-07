require 'net/http'

module Icinga
  class Server
    attr_accessor :options

    @@default_options = {
      :host => "localhost",
      :port => 80,
      :remote_path => "/icinga/cgi-bin/status.cgi", 
      :format => "json",
    }

    def connection
      @conn ||= Net::HTTP.new(@options[:host], @options[:port])
    end

    def new_request(path)
      req = Net::HTTP::Get.new(@options[:remote_path] + path + "&" + @options[:format] + "output")
      req.basic_auth @options[:user], @options[:password] if @options[:user]
      req
    end

    def hosts
      Responder.new(self, new_request("?hostgroup=all&style=hostdetail"))
    end

    def services
      Responder.new(self, new_request("?host=all&style=servicedetail"))
    end

    def initialize(options = {})
      @options = @@default_options.merge(options)
    end
  end
end
