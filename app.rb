require 'net/http'
require 'json'
require 'puma'
require 'sinatra'
require 'newrelic_rpm'

get '/' do
	'This works'
end

get '/:airport' do
	@array = []
	uri = Net::HTTP.get("services.faa.gov", "/airport/status/#{params[:airport].upcase}?format=application/json")
	json = JSON.parse(uri)
	@array << json["name"]
	@array << json["weather"]["weather"]
	@array << json["weather"]["temp"]
	@array << json["status"]["reason"]
	erb :airport
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

