module USDAMarketExporter
  class Market

    attr_accessor :id, :name, :website, :street, :city, :county, :state, :zipcode, :season_1_date, :season_1_time, :season_2_date, :season_2_time, :season_3_date, :season_3_time, :lat, :long, :location_description, :credit, :wic, :wiccash, :sfmnp, :snap, :baked_goods, :cheese, :crafts, :flowers, :eggs, :seafood, :herbs, :vegetables, :honey, :jams, :maple, :meat, :nursery, :nuts, :poultry, :prepared, :soap, :trees, :wine

    def initialize(data)
      @id = data[:id]
      @name = data[:name]
      @website = data[:website]
      @street = data[:street]
      @city = data[:city]
      @county = data[:county]
      @state = data[:state]
      @zipcode = data[:zip]
      @season_1_date = data[:season_1_date]
      @season_1_time = data[:season_1_time]
      @season_2_date = data[:season_2_date]
      @season_2_time = data[:season_2_time]
      @season_3_date = data[:season_3_date]
      @season_3_time = data[:season_3_time]
      @lat = data[:latitude]
      @long = data[:longitude]
      @location_description = data[:location_description]
      @credit = data[:credit]
      @wic = data[:wic]
      @wiccash = data[:wiccash]
      @sfmnp = data[:sfmnp]
      @snap = data[:snap]
      @baked_goods = data[:baked_goods]
      @cheese = data[:cheese]
      @crafts = data[:crafts]
      @flowers = data[:flowers]
      @eggs = data[:eggs]
      @seafood = data[:seafood]
      @herbs = data[:herbs]
      @vegetables = data[:vegetables]
      @honey = data[:honey]
      @jams = data[:jams]
      @maple = data[:maple]
      @meat = data[:meat]
      @nursery = data[:nursery]
      @nuts = data[:plants]
      @poultry = data[:poultry]
      @prepared = data[:prepared]
      @soap = data[:soap]
      @trees = data[:trees]
      @wine = data[:wine]
    end
  end
end

