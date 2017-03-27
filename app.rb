require_relative './lib/api_call'
require 'json'
require 'shotgun'
require 'puma'
require 'sinatra'
require 'net/http'
require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-migrations'
require 'dm-sqlite-adapter'
require 'data_mapper'
require 'newrelic_rpm'

DataMapper.setup :default, "sqlite://#{Dir.pwd}/database.rb"

class Airport
  include DataMapper::Resource

  property :id, Serial
  property :code, String
  property :name, String
  property :city, String
  property :state, String

end

DataMapper.finalize.auto_upgrade!

# configure :development do
#   DataMapper.auto_upgrade!
# end

get '/' do
	@airports = Airport.all
	erb :home
end

get '/airport' do
  code = params["airport_code"]
	@data = AirportAPI.new(code).grab_url
	erb :airport
end

get '/test' do
  @airports = Airport.all
  erb :"test.js"
end

