class Loco2RouteSearcher
  require 'nokogiri'
  require_relative './loco2/search'

  def initialize(file_path)
    @file_path = file_path
    @results_hash = nil
    @results = nil
  end

  def search
    results_text = File.readlines(@file_path).join
    results_xml = Nokogiri::XML::Document.parse results_text
    @results_hash = parse_xml_results results_xml
    tag_cheapest_result
    tag_quickest_result
    cast_results
  end

  def results
    @results
  end

  private

  def parse_xml_results(doc)
    doc.xpath('/SearchResults/SearchResult').map do |node|
      {
        id: node.xpath('ID').text,
        connections: parse_xml_result_connections(node)
      }
    end
  end

  def parse_xml_result_connections(result_node)
    result_node.xpath('Connections/Connection').map do |node|
      {
        departure: node.xpath('Start').text,
        departure_at: node.xpath('DepartureTime').text,
        arrival: node.xpath('Finish').text,
        arrival_at: node.xpath('ArrivalTime').text,
        transport_name: node.xpath('TrainName').text,
        fares: parse_xml_result_connection_fares(node)
      }
    end
  end

  def parse_xml_result_connection_fares(connection_node)
    connection_node.xpath('Fares/Fare').map do |node|
      {
        name: node.xpath('Name').text,
        price: node.xpath('Price/Value').text,
        currency: node.xpath('Price/Currency').text,
      }
    end
  end

  def tag_cheapest_result
  end

  def tag_quickest_result
  end

  def cast_results
    @results = Loco2::Search.cast @results_hash
  end

end
