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

get '/master' do
  content_type :json
  File.read('public/master.json')
end

get '/location/:year' do
  master_sheet = JSON.parse(File.read('public/master.json'))
  @LocationCounter = LocationCounter.new()
  my_json = @LocationCounter.location_loop(params['year'], master_sheet)

  content_type :json
  my_json.flatten!
  return my_json.to_json

end

get '/envelopes' do
  content_type :json
  File.read('public/envelopes.json')
end

get '/pooled' do
  content_type :json
  File.read('public/envelopes.json')
end
