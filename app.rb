require "sinatra"

set :public_folder, 'public'
get '/' do
    'Hello world!'
end

get '/master' do
    content_type :json
    File.read('public/master.json')
end

get '/envelopes' do
    content_type :json
    File.read('public/envelopes.json')
end

get '/pooled' do
    content_type :json
    File.read('public/envelopes.json')
end
