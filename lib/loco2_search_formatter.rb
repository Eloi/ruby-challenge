class Loco2SearchFormatter
  require_relative './loco2/search'

  def initialize(results, format: :records)
    @results = results
    @format = format
    @cheapest = Loco2::Search.cheapest(results)
    @quickest = Loco2::Search.quickest(results)
  end


  def format
    case @format
    when :records
      format_records
    else
      raise "Unknown format"
    end
  end

  def format_records
    @results[:results].map{|r| format_record r}.join("\n")
  end


  def format_record(result)
    record = []
    waiting_times = format_waiting_times(result[:connections])
    record << format_header(result)
    record << ""
    result[:connections].each_with_index{  |connection, idx|
      record << format_connection(connection, waiting_times[idx])
    }
    # record << result[:connections].map_with_index{|c, idx| format_connection c, waiting_times[idx]}
    record << ""

    record.join "\n"
  end

  def format_header(result)
    [
      '-------------',
      " | Identifier #{result[:id]}",
      " | Travel Time #{travel_time result}",
      " | #{result[:connections].size-1} train change/s",
      (result == @cheapest ? " | CHEAPEST!" : ""),
      (result == @quickest ? " | QUICKEST!" : ""),
      ' | -------------',
    ].join
  end

  def format_connection(connection, waiting_time)
    [
      "[[ #{connection_time connection} #{waiting_time}]]",
      connection[:departure_at],
      connection[:departure].ljust(31,' '),
      " -> ",
      connection[:arrival_at],
      connection[:arrival].ljust(31,' '),
      "\n    ==> Train:",
      connection[:transport_name],
      "\n    ==> Prices:",
      format_fares(connection[:fares]),
      "\n",
    ].join(" ")
  end

  def format_fares(fares)
    fares.map do |fare|
      "#{fare[:name]} #{fare[:price]}#{fare[:currency]}"
    end.join(", ")
  end

  def format_waiting_times(connections)
    Loco2::Search.connections_waiting_seconds(connections).map do |seconds|
      seconds == 0 ? '' : '+%dh:%02dm wait ' % [ seconds / 3600, (seconds / 60) % 60]
    end
  end

  def time(datetime)
    travel_seconds = Loco2::Search.travel_seconds(result)
    '%dh:%02dm' % [ travel_seconds / 3600, (travel_seconds / 60) % 60]
  end

  def travel_time(result)
    travel_seconds = Loco2::Search.travel_seconds(result)
    '%dh:%02dm' % [ travel_seconds / 3600, (travel_seconds / 60) % 60]
  end

  def connection_time(connection)
    connection_seconds = Loco2::Search.connection_seconds(connection)
    '%dh:%02dm' % [ connection_seconds / 3600, (connection_seconds / 60) % 60]
  end

end
