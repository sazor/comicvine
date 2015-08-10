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

    def self.build_query(hash, keys)
      hash = filter_hash(hash, keys)
      if hash.keys.include? :field_list
        hash[:field_list] = hash[:field_list].join(",")
      end
      if hash.keys.include? :filter
        hash[:filter] = hash[:filter].to_a.map { |el| el.join(":") }.join(",")
      end
      if hash.keys.include? :sort
        hash[:sort] = hash[:sort].to_a.map { |el| el.join(":") }.join(",")
      end
      hash
    end

    def self.filter_hash(hash, keys)
      hash.select { |key, value| keys.include? key }
    end
  end
end