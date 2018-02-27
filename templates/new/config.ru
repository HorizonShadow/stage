require_relative 'webservice/config/app.rb'

use Rack::Static, urls: ['/js'], root: 'public'

map('/api') do
  map('/users') { run Webservice::Controllers::Users }
end

map('/') do
  index = File.read('public/index.html')
  app = proc do
    ['200', { 'Content-Type' => 'text/html' }, [index]]
  end
  run app
end