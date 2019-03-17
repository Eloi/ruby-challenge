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

    class << self

      def travel_seconds(result)
        (result[:connections].last[:arrival_at].to_time - result[:connections].first[:departure_at].to_time).to_i
      end

      def connection_seconds(connection)
        (connection[:arrival_at].to_time - connection[:departure_at].to_time).to_i
      end

      def connections_waiting_seconds(connections)
        seconds = [0]
        for i in 1..(connections.size-1)
          seconds << (connections[i][:departure_at].to_time - connections[i-1][:arrival_at].to_time).to_i
        end
        seconds
      end

    end
  end
end
