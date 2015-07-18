module Comicvine
  module Utils
    def self.symbolize_keys(old_hash)
      result = {}
      old_hash.each_key do |key|
        result[key.to_sym] = old_hash[key]
      end
      result
    end
  end
end