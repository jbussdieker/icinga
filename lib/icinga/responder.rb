require 'csv'
require 'json'

module Icinga
  class Responder
    def initialize(server, request)
      @server = server
      @request = request
    end

    def response
      begin
        @response ||= @server.connection.request(@request)
      rescue Exception => e
        e
      end
    end

    def data
      if response.kind_of? Net::HTTPSuccess
        {:data => JSON.parse(response)} if @server.options[:format] == "json"
        {:data => CSV.parse(response)} if @server.options[:format] == "csv"
      else
        {:error => response.message}
      end
    end

    def to_s
      data[:data] || ""
    end
  end
end
