require 'json'

class TreeMap

  def initialize()
    @valid_place_names = ["FGS", "Benadir", "Galmudug", "Hiirshabelle", "Jubaland", "Puntland", "South West", "Somaliland", "Unattributed"]
    @location_array = []
  end

  def tree_map(year, location, json_file)
    counter = 0
    search_key = year+" - "+location

    p search_key

    while counter < json_file.length do
      if (json_file[counter].has_key? search_key)

        if (json_file[counter]["NDP Pillar"] === "Pillar 1: Inclusive Politics" && json_file[counter][search_key] > 0)
          @location_array.push(
            {
              "Project title" => json_file[counter]["Project title"],
              "Project cost" => json_file[counter][search_key]
            }
          )
        end
        counter += 1
      end
      p @location_array

    end
    return @location_array

  end
end

TreeMap.new
