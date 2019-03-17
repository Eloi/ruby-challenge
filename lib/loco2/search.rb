module Loco2
  require 'hashcast'
  require 'time'

  class Search
    include HashCast::Caster

    attributes do
      array :results, each: :hash do
        string :id
        array :connections, each: :hash do
          string :departure
          datetime :departure_at
          string :arrival
          datetime :arrival_at
          string :transport_name
          array :fares, each: :hash do
            string :name
            float :price
            string :currency
          end
        end
      end
    end

  end
end
