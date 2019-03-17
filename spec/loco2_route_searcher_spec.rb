require 'rspec'
require_relative '../lib/loco2_route_searcher.rb'


describe Loco2RouteSearcher do
  let(:xml_file_path){ File.expand_path("support/search.xml", File.dirname(__FILE__)) }

  it "has to exist" do
    expect(Loco2RouteSearcher).to be Loco2RouteSearcher
  end

  it "has to load the XML file and convert it to a Loco2::Search" do
    results = Loco2RouteSearcher.new(xml_file_path).search
    expect(results.class).to be Hash
  end

end
