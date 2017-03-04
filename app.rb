require_relative './lib/api_call'
require_relative './db/datastore_hash'
require 'json'
require 'shotgun'
require 'puma'
require 'sinatra'
require 'net/http'
require 'newrelic_rpm'

helpers do
	def strip_brackets_quotes(array)
		array.join
	end
end
  
get '/' do
	@form_city = Airport::FormAttributes.new.airport_city
	erb :home
end

get '/airport' do
	code = params[:airport_code] 
	@data = AirportAPI.new(code).grab_url
	puts @data.class
	erb :airport
end

get '/airport/:airport' do
	@array = []
	uri = Net::HTTP.get("services.faa.gov", "/airport/status/#{params[:airport].upcase}?format=application/json")
	json = JSON.parse(uri)
	@array << json["name"]
	@array << json["weather"]["weather"]
	@array << json["weather"]["temp"]
	@array << json["status"]["reason"]
	erb :airport
end


get '/npr' do
	# @empty_array = []
	payload = URI("http://api.npr.org/query?id=10005&output=JSON&apiKey=MDE4NjA4OTI1MDE0MjcwOTI1MjdkMjA1OQ001")
	# json_payload = JSON.parse(payload)
	# @empty_array << json_payload.class
	Net::HTTP.get(payload)
	

end

get '/yahoo' do
	uri = RestClient.get 'http://yahoo.com'
end

get '/test' do
	'testing ignore'
end


# pdx_uri = Net::HTTP.get('services.faa.gov','/airport/status/PDX?format=application/json')
# lax_uri = Net::HTTP.get('services.faa.gov','/airport/status/SFO?format=application/json')

# pdx_json = JSON.parse(pdx_uri)
# lax_json = JSON.parse(lax_uri)


# puts pdx_json["name"]
# puts pdx_json["weather"]["weather"]
# puts pdx_json["delay"]
# puts "\n"
# puts lax_json["name"]
# puts lax_json["weather"]["weather"]
# puts lax_json["weather"]["temp"]
# puts lax_json["delay"]
# puts lax_json["status"]["reason"]

