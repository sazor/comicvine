describe Comicvine::Character, vcr: { record: :new_episodes } do
  describe ".find" do
    context "when want get all chars" do
      let(:chars) { Comicvine::Character.find }

      it "returns modified array" do
        expect(chars).to respond_to(:limit, :offset, :page_results, :total_results)
      end

      it "sets number of page result properly" do
        expect(chars.page_results).to eq(100)
      end

      it "returns 100 elements" do
        expect(chars.size).to eq(100)
      end

      it "returns modified array of compact characters" do
        expect(chars.first).to be_a(Comicvine::Character::CompactCharacter)
      end

      it "can change limit" do
        chars = Comicvine::Character.find(limit: 55)
        expect(chars.limit).to eq(55)
      end

      it "can change offset and limit" do
        chars = Comicvine::Character.find(offset: 10, limit: 70)
        expect(chars.offset).to eq(10)
        expect(chars.limit).to eq(70)
      end

      it "can choose fields" do
        fields = [:id, :name, :gender]
        chars = Comicvine::Character.find(field_list: fields)
        expect(chars.first.fields).to match_array(fields)
      end
    end

    context "when want filter chars" do
      let(:custom_filter) { { name: "Constantine", gender: "Male" } }
      let(:chars) { Comicvine::Character.find(filter: custom_filter) }

      it "returns filtred array" do
        expect(chars.first.name).to eq("John Constantine")
        expect(chars.first.gender).to eq(1)
      end
    end

    context "when want sort chars" do
      let(:custom_sort) { { id: :desc } }
      let(:chars) { Comicvine::Character.find(sort: custom_sort) }

      it "returns chars with descending ids" do
        array_sorted = chars.each_cons(2).all? { |a, b| (a.id <=> b.id) >= 0 }
        expect(array_sorted).to be true
      end
    end
  end

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