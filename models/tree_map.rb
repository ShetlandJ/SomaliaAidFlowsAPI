require 'json'

class TreeMap

  def initialize()
    @product = []
    @valid_place_names = ["FGS", "Benadir", "Galmudug", "Hiirshabelle", "Jubaland", "Puntland", "South West", "Somaliland", "Unattributed"]
    @valid_pillar_names = [
      "Pillar 1: Inclusive Politics",
      "Pillar 2",
      "Pillar 3",
      "Pillar 4",
      "Pillar 5",
      "Pillar 6",
      "Pillar 7",
      "Pillar 8"
    ]

    @valid_sector_names = [
      "Civil Service Reform / Public Administration",
      "Cross-cutting resilience",
      "Education",
      "Enabling services",
      "Energy and ICT",
      "Food Security",
      "Gender & Human Rights",
      "Health",
      "Inclusive Politics",
      "Lifesaving humanitarian - cross-cutting",
      "Migration, Displacement, Refugees and Durable Solutions",
      "Mixed Infrastructure",
      "Natural Resources Management",
      "Peacekeeping / Military (excluded from sector totals)",
      "Planning, M&E and Statistics",
      "Private Sector Development",
      "Productive Sectors (Agriculture, Fisheries, Livestock)",
      "Public Financial Management",
      "Rule of Law",
      "Security",
      "Social Protection",
      "State and Local Governance",
      "Transport: Roads, Ports, Airports",
      "WASH",
      "Water and Sanitation (Urban)"
    ]

    @location_array = []
  end

  def tree_map(location, year, pillar, json_file)
    sector_array = []
    temp_array = []

    counter = 0
    search_key = year+" - "+location

    while counter < json_file.length do
      if (json_file[counter].has_key? search_key)
        if (json_file[counter][search_key] > 0)
          temp_array.push(json_file[counter])
        end
        counter += 1
      end
    end

    the_array = []

    for project in temp_array
      if (project["NDP Pillar"].include? pillar)
        @location_array.push(project)
      end
    end
    @product.push(location => {pillar => @location_array})
  end

  def pillar_loop(location, year, json_file)
    
    tree_map(location, year, "Pillar 1", json_file)
    tree_map(location, year, "Pillar 2", json_file)
    tree_map(location, year, "Pillar 3", json_file)
    tree_map(location, year, "Pillar 4", json_file)
    tree_map(location, year, "Pillar 5", json_file)
    tree_map(location, year, "Pillar 6", json_file)
    tree_map(location, year, "Pillar 7", json_file)
    tree_map(location, year, "Pillar 8", json_file)

    return @product.to_json

  end

end

TreeMap.new
