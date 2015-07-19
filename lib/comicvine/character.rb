module Comicvine
  module Character
    URL = "/characters"
    FIELDS = [ :aliases, :api_detail_url, :birth, :character_enemies,
               :character_friends, :count_of_issue_appearances, :creators, :date_added, :date_last_updated,
               :deck, :description, :first_appeared_in_issue, :gender, :id, :image, :issue_credits, :issues_died_in,
               :movies, :name, :origin, :powers, :publisher, :real_name, :site_detail_url, :story_arc_credits,
               :team_enemies, :team_friends, :teams, :volume_credits ]

    COMPACT_FIELDS = [ :aliases, :api_detail_url, :birth,
                       :count_of_issue_appearances, :date_added, :date_last_updated,
                       :deck, :description, :first_appeared_in_issue, :gender, :id, :image,
                       :name, :origin, :publisher, :real_name, :site_detail_url ]

    DIFF_FIELDS = FIELDS - COMPACT_FIELDS

    SingleCharacter  = Struct.new(*FIELDS) do
      def fields
        members.reject { |m| self[m].nil? }
      end
    end

    CompactCharacter = Struct.new(*COMPACT_FIELDS) do
      def fields
        members.reject { |m| self[m].nil? }
      end
    end

    def self.fetch(compact, fields = nil)
      query = fields.join(",") if fields # field_list must be string with ',' delimiter
      response = Comicvine::Utils.make_request(compact["api_detail_url"], field_list: query)
      character = response["results"]
      Comicvine::Utils.create_structure(SingleCharacter, character)
    end
  end
end