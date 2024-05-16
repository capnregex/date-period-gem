# frozen_string_literal: true

require 'date'
require "active_support"
require "active_support/core_ext/date"
require_relative "period/version"

class Date
  module Period
    class Error < StandardError; end
    # Your code goes here...
  end
end
