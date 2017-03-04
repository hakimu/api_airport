require 'yaml/store'

Airport = Struct.new :code, :airport, :city, :state

airports = [Airport.new("ATL","Hartsfield-Jackson Atlanta International Airport", "Atlanta", "GA"),
           Airport.new("LAX","Los Angeles International Airport", "Los Angeles","CA"),
           Airport.new("ORD", "O'Hare International Airport","Chicago","IL"),
           Airport.new("DFW", "Dallas/Fort Worth International Airport", "Dallas/Fort Worth","TX"),
           Airport.new("JFK", "John F. Kennedy International Airport","New York", "NY"),
           Airport.new("DEN", "Denver International Airport","Denver","CO"),
           Airport.new("SFO","San Francisco International Airport", "San Francisco", "CA"),
           Airport.new("CLT","Charlotte Douglas International Airport", "Charlotte","NC"),
           Airport.new("LAS", "McCarran International Airport", "Las Vegas","NV"),
           Airport.new("PHX","Phoenix Sky Harbor International Airport","Phoenix","AZ"),
           Airport.new("MIA", "Miami International Airport", "Miami", "FL"), 
           Airport.new("IAH","George Bush International Airport", "Houston","FL"),
           Airport.new("SEA","Seattle-Tacoma International Airport","Seattle/Tacoma","WA"),
           Airport.new("MCO","Orlando International Airport","Orlando","FL"),
           Airport.new("EWR","Newark Liberty International Airport","Newark","NJ"),
           Airport.new("MSP", "Minneapolis-Saint Paul International Airport","Minneapolis-Saint Paul","MN"),
           Airport.new("BOS","Logan International Airport","Boston","MA"),
           Airport.new("DTW","Detroit Metropolitan Airport","Detroit","MI"),
           Airport.new("PHL","Philadelphia International Airport","Philadelphia","PA"),
           Airport.new("LGA","LaGuardia Airport","New York","NY")
]

store = YAML::Store.new "airports.yaml"

store.transaction do
  store["airports"] = airports
end