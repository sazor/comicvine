VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = {
    record: :once,
    match_requests_on: [:method, :uri, :body]
  }
end

def handle_vcr(example)
  return run_with_http_interaction(example) if ENV['VCR_OFF']
  VCR.use_cassette(name, options) { example.call }
end

def run_with_http_interaction(example)
  WebMock.allow_net_connect!
  VCR.turned_off { example.call }
  WebMock.disable_net_connect!
end