require "httparty"
require "pry"
require 'active_support'
require 'active_support/core_ext/hash'
require "comicvine/version"
require "comicvine/paginated_array"
require "comicvine/utils"
require "comicvine/character"

module Comicvine
  module API
    @key = ENV["COMICVINE_API_KEY"] # default value

    BASE_URL = "http://beta.comicvine.com/api"
    FORMAT = "json"
    QUERY = { api_key: @key, format: FORMAT }

    class << self
      attr_accessor :key
    end
  end
end
