require 'net/http'
require 'json'

module Icinga
  class Server
    attr_accessor :options

    @@default_options = {
      :host => "localhost",
      :port => 80,
    }

    def connection
      @conn ||= Net::HTTP.new(@options[:host], @options[:port])
    end

    def new_request(path)
      req = Net::HTTP::Get.new(path)
      req.basic_auth @options[:user], @options[:password] if @options[:user]
      req
    end

    def hosts
      resp = connection.request(new_request("/icinga/cgi-bin/status.cgi?hostgroup=all&style=hostdetail&jsonoutput"))
      JSON.parse(resp.body)
    end

    def services
      resp = connection.request(new_request("/icinga/cgi-bin/status.cgi?host=all&style=servicedetail&jsonoutput"))
      JSON.parse(resp.body)
    end

    def initialize(options={})
      @options = @@default_options.merge(options)
    end
  end
end
