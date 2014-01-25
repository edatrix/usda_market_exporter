require_relative './test_helper'

class USDAMarketExporterTest < Minitest::Test
  def test_it_exists
    assert USDAMarketExporter::Parser
  end

  def test_it_parses_a_data_file
    mp = USDAMarketExporter::Parser.new
    markets_parsed = mp.parse_file('./test/fixtures/2013_faker_markets.csv')
    assert_equal 11, markets_parsed.count
  end

  def test_it_converts_to_boolean
    mp = USDAMarketExporter::Parser.new
    y = "Y"
    n = "N"
    assert_equal true, mp.convert_boolean(y)
    assert_equal false, mp.convert_boolean(n)
  end

  def test_it_converts_season_dates
    mp = USDAMarketExporter::Parser.new
    input_gregorian_MDY = "11/09/03 to 01/12/04"
    input_month_range = "July to October"
    assert_equal "November to January", mp.convert_season_date(input_gregorian_MDY)
    assert_equal "July to October", mp.convert_season_date(input_month_range)
  end

  def test_the_market_data_is_accessible
    skip
    mp = USDAMarketExporter::Parser.new
    markets_parsed = mp.parse_file('./test/fixtures/2013_faker_markets.csv')
    market = markets_parsed.first
    assert_equal "1005969", market.id
    assert_equal '"Y Not Wednesday Farmers Market at Town Center"', market.name
    assert_equal "http://www.sandlercenter.org/index/ynotwednesdays", market.website
    assert_equal "201 Market Street", market.street
    assert_equal "Virginia Beach", market.city
    assert_equal "Virginia Beach", market.county
    assert_equal "Virginia", market.state
    assert_equal "23462", market.zipcode
  end
end


