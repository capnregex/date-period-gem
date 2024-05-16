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
class Date
  module Period
    extend Period::ClassMethods
    UNITS = ActiveSupport::HashWithIndifferentAccess.new(
      day: Period::Day,
      days: Period::Days,
      week: Period::Week,
      pay_period: Period::PayPeriod,
      month: Period::Month,
      quarter: Period::Quarter,
      year: Period::Year,
      custom: Period::Custom
    )
  end
end
