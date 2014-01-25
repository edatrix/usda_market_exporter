require_relative './test_helper'

class USDAMarketExporterTest < Minitest::Test
  def test_it_exists
    assert USDAMarketExporter::Parser
  end

  def test_it_parses_a_data_file
    mp = USDAMarketExporter::Parser.new
    markets_parsed = mp.parse_file('./test/fixtures/2013_faker_markets.csv')
    assert_equal 4, markets_parsed
  end

  def test_the_market_data_is_accessible
    skip
    mp = Parser.new
    markets_parsed = mp.parse_file('./test/fixtures/2013_faker_markets.csv')
    market = mp.markets_parsed.first
    assert_equal "1005969", market.id
    assert_equal """Y Not Wednesday Farmers Market at Town Center""", market.name
    assert_equal "http://www.sandlercenter.org/index/ynotwednesdays", market.website
    assert_equal "201 Market Street", market.street
    assert_equal "Virginia Beach", market.city
    assert_equal "Virginia Beach", market.county
    assert_equal "Virginia", market.state
    assert_equal "23462", market.zipcode
  end
end


