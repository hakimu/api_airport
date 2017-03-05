# require 'dm-core'
# require 'dm-timestamps'
# require 'dm-validations'
# require 'dm-migrations'
# require 'dm-sqlite-adapter'
# require 'data_mapper'

# DataMapper.setup :default, "sqlite://#{Dir.pwd}/database.rb"

# class Airport
#   include DataMapper::Resource

#   property :id, Serial
#   property :code, String
#   property :name, String
#   property :city, String
#   property :state, String

# end

# DataMapper.finalize.auto_upgrade!



