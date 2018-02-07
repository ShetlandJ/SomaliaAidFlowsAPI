require "json"

class ProjectTable

  def initialize()
    @my_array = []
    # move_keys()
    master_sheet = JSON.parse(File.read('../public/master.json'))

    hash_cleaner(master_sheet[0])
  end

  def move_keys()
    master_sheet = JSON.parse(File.read('../public/master.json'))
    for hashes in master_sheet
      p hashes
    end
  end

  def hash_cleaner(my_hash)

    my_hash.delete_if { |key, value| key != "Project title" && key != "Start Date" && key != "End Date" && key != "NPD Pillar" && key != "Primary Sector" && key != "Funders" && key != "Implementers" && key != "Implementer Category" && key != "Project Value (USD)" && key != "2016 Disbursements (USD)" && key != "2017 Disbursements (USD)" && key != "2018 Disbursements (USD)" }
    @my_array.push(my_hash)

  end

end
ProjectTable.new
