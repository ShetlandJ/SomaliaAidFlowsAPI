require 'json'

class LocationCounter

  def initialize()
    @location_array = []
    @total = 0
    @counter = 0
    get_location("2016", "FGS")
  end

  def get_location(year, location)
    json_file = JSON.parse(File.read('../public/master.json'))
    for hash in json_file
      hash.each do |key, value|
        if (key == year+" - "+location && value > 0)
          @total += value
          @counter += 1
        end
      end

    end
    @location_array.push(location + ", " + year => {@total => @counter})
    p @location_array

  end
end
  LocationCounter.new
