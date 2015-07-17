require 'spec_helper'

describe Comicvine do
  let!(:env_api_key) { ENV["COMICVINE_API_KEY"] }

  describe ".api_key" do
    let(:example_api_key) { "EXAMPLE" }
    context "if api key wasn't set" do
      it { expect(Comicvine.api_key).to eq(env_api_key) }
    end
    context "if api key was set" do
      it "properly get from module" do
        Comicvine.api_key = example_api_key
        expect(Comicvine.api_key).to eq(example_api_key)
      end
    end
  end
end