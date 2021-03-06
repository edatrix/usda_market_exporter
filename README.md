# USDA Farmer's Market Exporter

## Why

The USDA Farmer's Market directory has a clunky interface at best, and the API that they provide to the public does not provide all of the data that they collect on farmer's markets around the country. Thus, I've converted their `.xlsx` format to `.csv`, and began exporting the data to objects and normalizing the data for easier consumption, with the intention of creating a much better API service for the public to use.


## Installation
1. `git clone git@github.com:pzula/usda_market_exporter.git`
2. The data extract from the 2013 USDA data is found in `/source`
3. Data gets parsed to `Market` objects.
3. Haven't built the export function yet, but will be available soon.


## Usage
There's probably no real reason for you to download this when you can instead use the API we built over at <http://github.com/freshfinder>. The parsed data can be found at <http://freshfinder.us/api/v1/markets> for all market lists, or hop over to the [FreshFinder API Readme](https://github.com/FreshFinder/to-the-market-api) for all of the endpoints of the parsed data.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
