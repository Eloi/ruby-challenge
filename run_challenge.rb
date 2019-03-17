# This file will be the entry point to show the challenge outcome
puts "Hello World"


require_relative 'lib/loco2_route_searcher'


searcher = Loco2RouteSearcher.new("./task/search.xml")


puts searcher.search.results

require 'pry'
binding.pry






