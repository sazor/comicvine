require "comicvine/version"

module Comicvine
  @api_key = ENV["COMICVINE_API_KEY"] # default value

  class << self
    def api_key
      @api_key
    end

    def api_key=(value)
      @api_key = value unless value.nil? || value.empty?
    end
  end
end
