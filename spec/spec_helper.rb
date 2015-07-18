require 'coveralls'
Coveralls.wear!

require 'webmock/rspec'
require 'vcr'
VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

require 'comicvine'
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
