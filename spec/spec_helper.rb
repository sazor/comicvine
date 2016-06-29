require 'coveralls'
require 'webmock/rspec'
require 'vcr'
require 'comicvine'
require 'vcr_helper'

Coveralls.wear!

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.around(:each, :vcr) do |example|
    handle_vcr(example)
  end
end
