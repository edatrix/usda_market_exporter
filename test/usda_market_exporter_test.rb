gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/usda_market_exporter.rb'

class USDAMarketExporterTest < Minitest::Test
  def test_it_exists
    assert USDAMarketExporter::Exporter
  end

  def test_it_opens

  end
end
