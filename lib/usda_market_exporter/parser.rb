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
                                    :credit => convert_boolean(line[:credit]),
                                    :wic => convert_boolean(line[:wic]),
                                    :wiccash => convert_boolean(line[:wiccash]),
                                    :sfmnp => convert_boolean(line[:sfmnp]),
                                    :snap => convert_boolean(line[:snap]),
                                    :baked_goods => convert_boolean(line[:bakedgoods]),
                                    :cheese => convert_boolean(line[:cheese]),
                                    :crafts => convert_boolean(line[:crafts]),
                                    :flowers => convert_boolean(line[:flowers]),
                                    :eggs => convert_boolean(line[:eggs]),
                                    :seafood => convert_boolean(line[:seafood]),
                                    :herbs => convert_boolean(line[:herbs]),
                                    :vegetables => convert_boolean(line[:vegetables]),
                                    :honey => convert_boolean(line[:honey]),
                                    :jams => convert_boolean(line[:jams]),
                                    :maple => convert_boolean(line[:maple]),
                                    :meat => convert_boolean(line[:meat]),
                                    :nursery => convert_boolean(line[:nursery]),
                                    :nuts => convert_boolean(line[:plants]),
                                    :poultry => convert_boolean(line[:poultry]),
                                    :prepared => convert_boolean(line[:prepared]),
                                    :soap => convert_boolean(line[:soap]),
                                    :trees => convert_boolean(line[:trees]),
                                    :wine => convert_boolean(line[:wine]))
    end



    def convert_boolean(line)
      line == "Y" ? true : false
    end


  end
end
