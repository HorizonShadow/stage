module Webservice
  module Controllers
    class Controller < Sinatra::Base
      helpers Helpers
      before do
        content_type :json
      end
    end
  end
end

require_relative '../controllers/users'