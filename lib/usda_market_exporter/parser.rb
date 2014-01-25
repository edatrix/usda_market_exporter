module USDAMarketExporter
  class Parser

    attr_reader :markets

    def parse_file(filename)
      data = open_file(filename)
      @markets = data.collect {|line| build_markets(line)}
    end

    def open_file(filename)
      CSV.open(filename, :headers => true, :header_converters => :symbol)
    end

    def build_markets(line)
      USDAMarketExporter::Market.new(:id => line[:fmid],
                                    :name => line[:marketname],
                                    :website => line[:website],
                                    :street => line[:street],
                                    :city => line[:city],
                                    :county => line[:county],
                                    :state => line[:state],
                                    :zipcode => line[:zip],
                                    :season_1_date => line[:season1date],
                                    :season_1_time => line[:season1time],
                                    :season_2_date => line[:season2date],
                                    :season_2_time => line[:season2time],
                                    :season_3_date => line[:season3date],
                                    :season_3_time => line[:season3time],
                                    :latitude => line[:x],
                                    :longitude => line[:y],
                                    :location_description => line[:location],
                                    :credit => parse_boolean(line[:credit]),
                                    :wic => parse_boolean(line[:wic]),
                                    :wiccash => parse_boolean(line[:wiccash]),
                                    :sfmnp => parse_boolean(line[:sfmnp]),
                                    :snap => parse_boolean(line[:snap]),
                                    :baked_goods => parse_boolean(line[:bakedgoods]),
                                    :cheese => parse_boolean(line[:cheese]),
                                    :crafts => parse_boolean(line[:crafts]),
                                    :flowers => parse_boolean(line[:flowers]),
                                    :eggs => parse_boolean(line[:eggs]),
                                    :seafood => parse_boolean(line[:seafood]),
                                    :herbs => parse_boolean(line[:herbs]),
                                    :vegetables => parse_boolean(line[:vegetables]),
                                    :honey => parse_boolean(line[:honey]),
                                    :jams => parse_boolean(line[:jams]),
                                    :maple => parse_boolean(line[:maple]),
                                    :meat => parse_boolean(line[:meat]),
                                    :nursery => parse_boolean(line[:nursery]),
                                    :nuts => parse_boolean(line[:plants]),
                                    :poultry => parse_boolean(line[:poultry]),
                                    :prepared => parse_boolean(line[:prepared]),
                                    :soap => parse_boolean(line[:soap]),
                                    :trees => parse_boolean(line[:trees]),
                                    :wine => parse_boolean(line[:wine]))
    end

private

    def parse_boolean(line)
      line == "Y" ? true : false
    end


  end
end
