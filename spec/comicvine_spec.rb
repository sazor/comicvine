describe Comicvine::API do
  describe ".key=" do
    it "allows to change api key from default value (env) to custom" do
      env_api_key, user_api_key = ENV["COMICVINE_API_KEY"], "example"
      expect { Comicvine::API.key = user_api_key }.to change(Comicvine::API, :key).from(env_api_key).to(user_api_key)
      Comicvine::API.key = env_api_key # set default value for other tests
    end
  end
end