require 'rspec'
require_relative '../lib/loco2/search'

describe Loco2::Search do

  it "should be a castable model" do
    expect(Loco2::Search.respond_to? :cast).to be true
  end

  it "should fail when casting missing data" do
    incomplete_data = {}
    expect{ Loco2::Search.cast incomplete_data }.to raise_error HashCast::Errors::MissingAttributeError
  end

  it "should fail when casting wrongly typed data" do
    wrong_data = {
      results: "data"
    }
    expect{ Loco2::Search.cast wrong_data }.to raise_error HashCast::Errors::CastingError
  end

end
