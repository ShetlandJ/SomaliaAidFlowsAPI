require 'json'

class TreeMap

  def initialize()
    @product = []
    @final_array = []
    @project_array = []

    @valid_place_names = ["FGS", "Benadir", "Galmudug", "Hiirshabelle", "Jubaland", "Puntland", "South West", "Somaliland", "Unattributed"]
    @valid_pillar_names = [
      "Pillar 1: Inclusive Politics",
      "Pillar 2: Security",
      "Pillar 3: Rule of Law",
      "Pillar 4: Effective, Efficient Institutions",
      "Pillar 5: Economic Growth",
      "Pillar 6: Infrastructure",
      "Pillar 7: Social & Human Development",
      "Pillar 8: Resilience"
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
    @master_sheet = JSON.parse(File.read('public/master.json'))
    one_project()
  end

  def one_project()
    @data = []
    @data.push(@master_sheet[1])
    @data.push(@master_sheet[4])
    banana = []
    pillar_array = []
    sector_array = []
    project_array = []
    country_array = []

    location = "2016 - Somaliland"
    place = "Somaliland"
    pillar = "Pillar 8"
    sector = "Food Security"

    for project in @data

      if (project[location] > 0)
        if (project["NDP Pillar"].include? pillar)
          if (project["Primary Sector"] === sector)

            project_array.push("Project title" => project["Project title"], "Value" => project[location])

            sector_array.push(sector => project_array[0])
            pillar_array.push(pillar => sector_array)
            country_array.push(place => pillar_array)
          end
        end
      end
      banana.push(country_array)
    end

    p banana.to_json
  end




  # def tree_map(location, year, pillar, sector, json_file)
  #   @location_array = []
  #   sector_array = []
  #   project_obj_array = []
  #   sector_array = []
  #   projects_array = []
  #
  #   counter = 0
  #   search_key = year+" - "+location
  #
  #   while counter < json_file.length do
  #     if (json_file[counter].has_key? search_key)
  #       if (json_file[counter][search_key] > 0)
  #         project_obj_array.push(json_file[counter])
  #       end
  #       counter += 1
  #     end
  #   end
  #
  #   for project in project_obj_array
  #     if ((project["NDP Pillar"].include? pillar) && (project["Primary Sector"].include? sector))
  #       projects_array.push("Project title" => project["Project title"], "Project value" => project[search_key])
  #     end
  #   end
  #
  #   for project in project_obj_array
  #     if ((project["NDP Pillar"].include? pillar) && (project["Primary Sector"].include? sector))
  #       sector_array.push(sector => projects_array[0])
  #     end
  #   end
  #
  #   for project in project_obj_array
  #     if ((project["NDP Pillar"].include? pillar) && (project["Primary Sector"].include? sector))
  #       @project_array.push(pillar => sector_array[0])
  #     end
  #   end
  #
  #   # for project in project_obj_array
  #   #   # p project["Primary Sector"]
  #   #   if ((project["NDP Pillar"].include? pillar) && (project["Primary Sector"].include? sector))
  #   #     @project_array.push(project["Primary Sector"] => { project["Project title"] =>  project["Project title"], "Project value" => project[search_key]})
  #   #     # @location_array.push(project["Primary Sector"] => {"Project title" =>project["Project title"], "Project "})
  #   #   end
  #   # end
  #
  #   @location_array.push(@project_array[0])
  #
  # end
  #
  # def pillar_loop(location, year, json_file)
  #   for sector in @valid_sector_names
  #     tree_map(location, year, "Pillar 1", sector, json_file)
  #   end
  #   @final_array.push("Pillar 1: Inclusive Politics" => @location_array)
  #   @project_array = []
  #   @location_array = []
  #
  #   for sector in @valid_sector_names
  #     tree_map(location, year, "Pillar 2", sector, json_file)
  #   end
  #   @final_array.push("Pillar 2: Security" => @location_array)
  #   @project_array = []
  #   @location_array = []
  #
  #   for sector in @valid_sector_names
  #     tree_map(location, year, "Pillar 3", sector, json_file)
  #     @final_array.push("Pillar 3: Rule of Law" => @location_array)
  #   end
  #   @project_array = []
  #   @location_array = []
  #
  #   for sector in @valid_sector_names
  #     tree_map(location, year, "Pillar 4", sector, json_file)
  #   end
  #   @final_array.push("Pillar 4: Effective, Efficient Institutions" => @location_array)
  #   @project_array = []
  #   @location_array = []
  #
  #   for sector in @valid_sector_names
  #     tree_map(location, year, "Pillar 5", sector, json_file)
  #   end
  #   @final_array.push("Pillar 5: Economic Growth" => @location_array)
  #   @project_array = []
  #   @location_array = []
  #
  #   for sector in @valid_sector_names
  #     tree_map(location, year, "Pillar 6", sector, json_file)
  #   end
  #   @final_array.push("Pillar 6: Infrastructure" => @location_array)
  #   @project_array = []
  #   @location_array = []
  #
  #   for sector in @valid_sector_names
  #     tree_map(location, year, "Pillar 7", sector, json_file)
  #   end
  #   @final_array.push("Pillar 7: Social & Human Development" => @location_array)
  #   @project_array = []
  #   @location_array = []
  #
  #   for sector in @valid_sector_names
  #     tree_map(location, year, "Pillar 8", sector, json_file)
  #   end
  #   @final_array.push("Pillar 8: Resilience" => @location_array)
  #   @project_array = []
  #   @location_array = []
  #
  #
  #   product = {location => @final_array}
  #   return product.to_json
  #
  # end

end

TreeMap.new
