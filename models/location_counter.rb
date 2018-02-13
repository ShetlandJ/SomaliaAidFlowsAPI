require 'json'

class LocationCounter

  def initialize()
    @valid_place_names = ["FGS", "Benadir", "Galmudug", "Hiirshabelle", "Jubaland", "Puntland", "South West", "Somaliland", "Unattributed"]
    @location_array = []
    @country_array = []
  end

  def get_location(year, location, json_file)
    index = 0
    project_counter = 0
    total = 0

    while index < json_file.length do
      if (json_file[index][year+" - "+location] > 0)
        total += json_file[index][year+" - "+location]
        project_counter += 1
      end
      index += 1
    end
    @country_array.push({"location" => location, "total" => total, "count" => project_counter})

  end

  def create_location_object(location, json_file, year)
    # years = ["2016", "2017", "2018"]
    #
    # for year in years
      get_location(year, location, json_file)
    # end
    @location_array.push(@country_array)
    @country_array = []

  end

  def location_loop(year, json_file)
    for location in @valid_place_names
      create_location_object(location, json_file, year)
    end

    return @location_array
  end


end

LocationCounter.new
