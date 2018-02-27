module Webservice
  module Controllers
    class Users < Controller
      get '/' do
        JSON.generate User.all
      end
    end
  end
end