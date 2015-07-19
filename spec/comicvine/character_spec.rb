describe Comicvine::Character, vcr: { record: :new_episodes } do
  describe ".fetch" do
    context "when want single detailed result" do
      let(:hash_constantine) do
        {
          id: 3329, name: "John Constantine", site_detail_url: "doesn't matter",
          api_detail_url: "http://beta.comicvine.com/api/character/4005-3329/"
        }
      end

      let(:compact_constantine) { Comicvine::Utils.create_structure(Comicvine::Character::CompactCharacter, hash_constantine) }

      context "with all fields" do
        let(:char) { Comicvine::Character.fetch(compact_constantine) }

        it "fetch detailed info using compact structure" do
          expect(char).to be_a(Comicvine::Character::SingleCharacter)
        end

        it "returns full detailed information" do
          expect(char.fields).to match_array(Comicvine::Character::FIELDS)
        end

        it "returns properly created structure" do
          expect(char.character_enemies).not_to be_empty # because john constantine always has an enemy
        end

        context "fetching enemy of our character" do
          it "fetch detailed info using hash" do
            enemy = Comicvine::Character.fetch(char.character_enemies.first)
            expect(enemy.name).to eq("Adam Constantine")
          end
        end
      end

      context "with specified fields" do
        let(:fields) { [:id, :name, :gender] }
        let(:char) { Comicvine::Character.fetch(compact_constantine, fields) }

        it "fetch detailed info using compact structure" do
          expect(char).to be_a(Comicvine::Character::SingleCharacter)
        end

        it "returns detailed information only with specified fields" do
          expect(char.fields).to match_array(fields)
        end

      end
    end
  end
end