require 'json'

class LocationCounter

  def initialize()
    @location_array = []
    @final_array = []
  end

  def get_location(year, location, json_file)
    p year
    total = 0
    counter = 0
    for hash in json_file
      hash.each do |key, value|
        if ((key == year+" - "+"FGS" || key == year+" - "+"fgs") && value > 0)
          total += value
          counter += 1
        elsif (key == year+" - "+location && value > 0)
          total += value
          counter += 1
        end
      end

    end
    @location_array.push({year => total, "count" => counter})

  end

  def return_all(json_file, location)
    get_location("2016", location, json_file)
    get_location("2017", location, json_file)
    get_location("2018", location, json_file)

    if (location === "fgs")
      @final_array.push(location.upcase => @location_array)
    else
      @final_array.push(location => @location_array)
    end
    return @final_array
  end

end

LocationCounter.new
