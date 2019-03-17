module Loco2
  require 'hashcast'

  class Search
    include HashCast::Caster

    attributes do
      hash :results do
        string :id
        hash :connections do
          string :departure
          time :departure_at
          string :arrival
          time :arrival_at
          string :transport_name
          hash :fares do
            string :name
            float :price
            string :currency
          end
        end
      end
    end

  end
end
