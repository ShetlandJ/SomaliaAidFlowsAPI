require 'json'

class LocationCounter

  def initialize()
    @location_array = []
    @final_array = []
  end

  def get_location(year, location, json_file)
    total = 0
    counter = 0
    for hash in json_file
      hash.each do |key, value|
        if (key == year+" - "+location && value > 0)
          total += value
          counter += 1
        end
      end

    end
    @location_array.push({year => total, "count" => counter})

  end

  def return_all(json_file)
    get_location("2016", "FGS", json_file)
    get_location("2017", "FGS", json_file)
    get_location("2018", "FGS", json_file)


    @final_array.push("FGS" => @location_array)
    return @final_array
  end

end

LocationCounter.new
