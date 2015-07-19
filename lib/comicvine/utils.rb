module Comicvine
  module Utils
    def self.symbolize_keys(old_hash)
      result = {}
      old_hash.each_key do |key|
        result[key.to_sym] = old_hash[key]
      end
      result
    end
    def self.make_request(url, custom_query = {})
      url = Comicvine::API::BASE_URL + url unless url.include?(Comicvine::API::BASE_URL)
      HTTParty.get(url, { query: Comicvine::API::QUERY.merge(custom_query) })
    end
    def self.create_structure(structure, hash)
      structure.new(*hash.values_at(*structure.members))
    end
  end
end