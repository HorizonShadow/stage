require 'data_mapper'

p Dir.pwd
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/webservice/db/data.db")
DataMapper::Model.raise_on_save_failure = true

require_relative '../models/user.rb'

DataMapper.auto_migrate!
# DataMapper.auto_upgrade!
DataMapper.finalize