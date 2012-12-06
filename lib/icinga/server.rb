require 'net/http'

module Icinga
  class Server
    attr_accessor :options

    @@default_options = {
      :host => "localhost",
      :port => 80,
    }

    def connection
      @conn ||= Net::HTTP.new(@host, @port)
    end

    def new_request(path)
      Net::HTTP::Get.new(path)
    end

    def initialize(options={})
      @options = @@default_options.merge(options)
    end
  end
end
