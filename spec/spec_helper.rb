# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  add_filter 'spec'
end

require 'proc/value'

RSpec.configure do |config|
  config.order = 'random'
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
