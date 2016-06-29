describe Comicvine::API do
  subject { Comicvine::API }

  describe '.access_key' do
    let (:example_key) { 'example_key' }

    it 'uses value of env variable' do
      expect(subject.config.access_key).to eq(ENV['COMICVINE_API_KEY'])
    end

    it 'can be set explicitly in code' do
      subject.config.access_key = example_key
      expect(subject.config.access_key).to eq(example_key)
    end

    context 'when key was not set' do
      it 'will throw an error' do
        subject.config.access_key = nil
        pending("use some method")
        # expect(subject.config.access_key).to raise_error(InvalidKeyError)
      end
    end
  end 

  describe '.url' do
    let (:example_url) { 'example_url' }

    it 'uses default value' do
      expect(subject.config.url).to eq('http://comicvine.gamespot.com')
    end

    it 'can be set explicitly in code' do
      subject.config.url = example_url
      expect(subject.config.url).to eq(example_url)
    end
  end
end