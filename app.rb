require 'rubygems'
require "sinatra"
require "json"

require_relative("./models/project_table")

set :public_folder, 'public'
get '/' do
    'Hello world!'
end

get '/project-page' do
    content_type :json
    File.read('public/master.json')
end

get '/project-table' do
    # content_type :json
    master_sheet = JSON.parse(File.read('public/master.json'))
    @project_table = ProjectTable.new();
    JSON.generate(@project_table.move_keys(master_sheet))
    # File.read('public/master.json')
end

get '/envelopes' do
    content_type :json
    File.read('public/envelopes.json')
end

get '/pooled' do
    content_type :json
    File.read('public/envelopes.json')
end
