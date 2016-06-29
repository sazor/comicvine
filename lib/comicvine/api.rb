module Comicvine
  class API
    extend Dry::Configurable

    setting :access_key, ENV['COMICVINE_API_KEY']
    setting :url, 'http://comicvine.gamespot.com'
  end
end