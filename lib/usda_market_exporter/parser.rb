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
                                    :season_1_date => convert_season_date(line[:season1date]),
                                    #:season_1_time => line[:season1time],
                                    :season_2_date => convert_season_date(line[:season2date]),
                                    #:season_2_time => line[:season2time],
                                    :season_3_date => convert_season_date(line[:season3date]),
                                    #:season_3_time => line[:season3time],
                                    :season_4_date => convert_season_date(line[:season4date]),
                                    #:season_4_time => line[:season4time],
:lng => line[:x],
                                    :lat => line[:y],
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

    def convert_season_date(season_date)
      unless season_date.nil?
        if season_date.include?("/")
          parse_date_range(season_date)
        else
          season_date
        end
      end
    end

    def season_date_splitter(date_range)
      dates = date_range.gsub("/", "-").gsub(" ", "").split("to")
      dates.map {|date| month_to_name(date)}
    end

    def month_to_name(date)
      Date.strptime(date, '%m-%d-%Y').strftime("%B")
    end

    def parse_date_range(date_range)
      season_date_splitter(date_range).join(" to ")
    end

    def convert_season_times(line)
      parsed_hash = Hash.new
      day_splitter(line).map do |day_time|
        parsed_hash[day_of_week_finder(day_time)] = time_of_day_finder(day_time)
      end
    end

    def day_splitter(input)
      input.split(";")
    end

    def day_of_week_finder(input)
      input[0..2]
    end

   def start_end_time_splitter(input)
      input.split("-")
    end

    def time_of_day_finder(input)
      input[4..-1]
    end

    def military_time_converter(input)
      ## figure it out
    end
  end
end

