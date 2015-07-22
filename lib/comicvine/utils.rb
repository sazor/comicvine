module Comicvine
  module Utils
    def self.make_request(url, custom_query = {})
      url = Comicvine::API::BASE_URL + url unless url.include?(Comicvine::API::BASE_URL)
      HTTParty.get(url, { query: Comicvine::API::QUERY.merge(custom_query) })
    end
    def self.create_structure(structure, hash)
      hash = hash.symbolize_keys
      structure.new(*hash.values_at(*structure.members))
    end
  end
end