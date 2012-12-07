module Icinga
  class Responder
    attr_reader :data

    require 'icinga/responder/json'
    require 'icinga/responder/csv'

    def self.create(klass, server, request)
      responder_klass = Icinga.const_get("#{server.options[:format].upcase}Responder")
      responder_klass.new(klass, server, request)
    end

    def response
      begin
        @response ||= @server.connection.request(@request)
      rescue Exception => e
        e
      end
    end

    def initialize(klass, server, request)
      @klass = klass
      @server = server
      @request = request
    end

    def to_s
      data.to_s
    end

    def each
      data.each {|item| yield(@klass.new(@server, item))}
    end
  end
end
