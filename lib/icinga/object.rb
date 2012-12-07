module Icinga
  class Object < Hash
    require 'icinga/object/host'
    require 'icinga/object/service'

    def initialize(server, data)
      @server = server
      merge!(data)
      name_field = self.class.to_s.split("::").last.downcase
      self["name"] = data[name_field]
    end

    def method_missing(method, *args, &block)
      self[method.to_s]
    end

    def to_s
      self["name"]
    end
  end
end
