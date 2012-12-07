require 'csv'

module Icinga
  class CSVResponder < Responder
    def data
      parse_options = {:headers => :first_row, :col_sep => ";", :quote_char => "'"}

      CSV.parse(response.body.strip, parse_options).collect do |row|
        new_hash = {}
        row.to_hash.each_pair do |k,v|
          new_hash.merge!({k.downcase => v}) 
        end
        new_hash
      end
    end
  end
end
