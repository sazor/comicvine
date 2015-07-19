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

    SingleCharacter  = Struct.new(*FIELDS)
    CompactCharacter = Struct.new(*COMPACT_FIELDS)

    def self.fetch(compact)
      response = Comicvine::Utils.make_request(compact[:api_detail_url])
      character = Comicvine::Utils.symbolize_keys(response["results"])
      Comicvine::Utils.create_structure(SingleCharacter, character)
    end
  end
end