require 'rubygems'
require "sinatra"
require "json"

require_relative("./models/hash_cleaner")
require_relative("./models/location_counter")


set :public_folder, 'public'
get '/' do
    'Hello world!'
end

get '/project-page' do
    content_type :json
    File.read('public/master.json')
end

get '/project-table' do
    master_sheet = JSON.parse(File.read('public/master.json'))
    @HashCleaner = HashCleaner.new();
    JSON.generate(@HashCleaner.move_keys(master_sheet))
end

get '/location/' do
  master_sheet = JSON.parse(File.read('public/master.json'))
  @LocationCounter = LocationCounter.new();
  my_json = @LocationCounter.location_loop(master_sheet)
  JSON.generate(my_json)
end

get '/envelopes' do
    content_type :json
    File.read('public/envelopes.json')
end

get '/pooled' do
    content_type :json
    File.read('public/envelopes.json')
end
