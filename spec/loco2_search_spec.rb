# coding: utf-8
require 'rspec'
require 'time'
require_relative '../lib/loco2/search'

describe Loco2::Search do
  let(:results_hash){
    {
      results: [{:id=>"F4S1DS",
                 :connections=>
                 [{:departure=>"London St Pancras International",
                   :departure_at=>"2015-07-11T09:23:00+01:00",
                   :arrival=>"Paris Nord",
                   :arrival_at=>"2015-07-11T12:41:00+02:00",
                   :transport_name=>"Eurostar",
                   :fares=>[{:name=>"Standard Class", :price=>"79.00", :currency=>"GBP"}, {:name=>"Standard Premier", :price=>"159.00", :currency=>"GBP"}]},
                  {:departure=>"Paris Lyon",
                   :departure_at=>"2015-07-11T13:56:00+02:00",
                   :arrival=>"Barcelona Sants",
                   :arrival_at=>"2015-07-11T20:17:00+02:00",
                   :transport_name=>"TGV 2N2",
                   :fares=>[{:name=>"Standard Class", :price=>"50.00", :currency=>"GBP"}, {:name=>"First Class", :price=>"75.00", :currency=>"GBP"}]}]},
                {:id=>"L2FSF4",
                 :connections=>
                 [{:departure=>"London St Pancras International",
                   :departure_at=>"2015-07-11T11:31:00+01:00",
                   :arrival=>"Paris Nord",
                   :arrival_at=>"2015-07-11T14:48:00+02:00",
                   :transport_name=>"Eurostar",
                   :fares=>[{:name=>"Standard Class", :price=>"69.00", :currency=>"GBP"}, {:name=>"Standard Premier", :price=>"179.00", :currency=>"GBP"}]},
                  {:departure=>"Paris Lyon",
                   :departure_at=>"2015-07-11T15:32:00+02:00",
                   :arrival=>"Barcelona Sants",
                   :arrival_at=>"2015-07-11T22:16:00+02:00",
                   :transport_name=>"TGV 2N2",
                   :fares=>[{:name=>"Standard Class", :price=>"25.50", :currency=>"GBP"}, {:name=>"First Class", :price=>"45.50", :currency=>"GBP"}]}]},
                {:id=>"D42GVV",
                 :connections=>
                 [{:departure=>"London St Pancras International",
                   :departure_at=>"2015-07-11T15:48:00+01:00",
                   :arrival=>"Paris Nord",
                   :arrival_at=>"2015-07-11T19:03:00+02:00",
                   :transport_name=>"Eurostar",
                   :fares=>[{:name=>"Standard Class", :price=>"39.00", :currency=>"GBP"}, {:name=>"Standard Premier", :price=>"59.00", :currency=>"GBP"}]},
                  {:departure=>"Paris Lyon",
                   :departure_at=>"2015-07-11T22:25:00+02:00",
                   :arrival=>"Perpignan",
                   :arrival_at=>"2015-07-12T06:48:00+02:00",
                   :transport_name=>"Intercités de Nuit",
                   :fares=>[{:name=>"Standard Class", :price=>"15.20", :currency=>"GBP"}, {:name=>"First Class", :price=>"27.00", :currency=>"GBP"}]},
                  {:departure=>"Perpignan",
                   :departure_at=>"2015-07-12T09:57:00+02:00",
                   :arrival=>"Barcelona Sants",
                   :arrival_at=>"2015-07-12T11:19:00+02:00",
                   :transport_name=>"AVE Class 100",
                   :fares=>[{:name=>"Standard Class", :price=>"20.00", :currency=>"GBP"}, {:name=>"First Class", :price=>"30.00", :currency=>"GBP"}]}]}]
    }
  }



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

  it "should parse properly a properly formatted results hash" do
    expect{ Loco2::Search.cast results_hash }.not_to raise_error
  end

end
