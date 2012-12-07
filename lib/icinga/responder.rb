module Icinga
  class Responder
    attr_reader :data

    require 'icinga/responder/json'
    require 'icinga/responder/csv'

    def self.create(klass, client, request)
      responder_klass = Icinga.const_get("#{client.options[:format].upcase}Responder")
      responder_klass.new(klass, client, request)
    end

    def response
      begin
        @response ||= @client.connection.request(@request)
      rescue Exception => e
        e
      end
    end

    def initialize(klass, client, request)
      @klass = klass
      @client = client
      @request = request
    end

    def to_s
      data.to_s
    end

    def each
      data.each {|item| yield(@klass.new(item))}
    end
  end
end
