require "json"

class HashCleaner

  def initialize()
    @my_array = []
  end

  def move_keys(json_file)
    for hash in json_file
      hash_cleaner(hash)
    end
    return @my_array
  end

  def hash_cleaner(my_hash)

    my_hash.delete_if { |key, value| key != "Project title" && key != "Start Date" && key != "End Date" && key != "NPD Pillar" && key != "Primary Sector" && key != "Funders" && key != "Implementers" && key != "Implementer Category" && key != "Project Value (USD)" && key != "2016 Disbursements (USD)" && key != "2017 Disbursements (USD)" && key != "2018 Disbursements (USD)" }
    @my_array.push(my_hash)

  end

end

HashCleaner.new
