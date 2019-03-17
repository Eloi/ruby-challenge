class Loco2RouteSearcher
  require_relative './loco2/search'

  def initialize(file_path)
    @file_path = file_path
    @results = nil
  end

  def search
    xml = parse_xml
    @results = Loco2::Search.cast(xml)
  end

  def results
    @results
  end

  private

  def parse_xml
    do_some_parsing
    tag_cheapest
    tag_quickest
  end

  def tag_cheapest
  end

  def tag_quickest
  end

end
