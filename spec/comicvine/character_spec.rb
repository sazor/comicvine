describe Comicvine::Character, :vcr do
  describe ".find" do
    context "when want single result by id" do
      let(:char_id) { 1254 }
      let(:char_alias) { "Nura Nal" }
      context "with all fields" do
        it "allows to get result by id" do
          char = Comicvine::Character.find(char_id)
          expect(char.aliases).to include(char_alias)
        end
      end
    end
  end
end