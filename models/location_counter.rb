require 'json'

class LocationCounter

  def initialize()
    @location_array = []
    @final_array = []
    @country_hash = {}
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
    @location_array.push(location => {year => total, "count" => counter})


  end

  def return_all(json_file)
    locations = ["FGS", "Benadir", "Galmudug", "Hiirshabelle", "Jubaland", "Puntland", "South West", "Somaliland", "Unattributed"]

    counter = 0
    for location in locations
      get_location("2016", locations[counter], json_file)
      get_location("2017", locations[counter], json_file)
      get_location("2018", locations[counter], json_file)
      counter += 1

      # if (location === "fgs")
      #   @final_array.push(location.upcase => @location_array)
      # else
      #   @final_array.push(location => @location_array)
      # end
    end
    return @location_array
  end



end

LocationCounter.new
