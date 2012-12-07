require 'json'

module Icinga
  class JSONResponder < Responder
    def data
      JSON.parse(response.body)["status"].first.last
    end
  end
end
