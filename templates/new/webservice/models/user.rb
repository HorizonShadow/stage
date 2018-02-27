module Webservice
  module Models
    class User
      include DataMapper::Resource

      property :id, Serial
      property :name, String
    end
  end
end