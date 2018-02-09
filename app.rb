require 'rubygems'
require "sinatra"
require "json"

require_relative("./models/hash_cleaner")
require_relative("./models/location_counter")
require_relative("./models/tree_map")

set :public_folder, 'public'
get '/' do
  erb (:home)
end

get '/project-page' do
  content_type :json
  File.read('public/master.json')
end

get '/project-table' do
  master_sheet = JSON.parse(File.read('public/master.json'))
  @HashCleaner = HashCleaner.new()
  JSON.generate(@HashCleaner.move_keys(master_sheet))
end

get '/location/:year' do
  master_sheet = JSON.parse(File.read('public/master.json'))
  @LocationCounter = LocationCounter.new()
  my_json = @LocationCounter.location_loop(params['year'], master_sheet)

  JSON.generate(my_json)
end

get '/:year/:location' do
  master_sheet = JSON.parse(File.read('public/master.json'))
  @TreeMap = TreeMap.new()
  my_json = @TreeMap.get_hash_by_key(params['year'], params['location'], master_sheet)
end

get '/envelopes' do
  content_type :json
  File.read('public/envelopes.json')
end

get '/pooled' do
  content_type :json
  File.read('public/envelopes.json')
end
