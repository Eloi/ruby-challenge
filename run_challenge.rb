# This file will be the entry point to show the challenge outcome

require_relative 'lib/loco2_route_searcher'
require_relative 'lib/loco2_search_formatter'


results = Loco2RouteSearcher.new("./task/search.xml").search

puts Loco2SearchFormatter.new(results).format
