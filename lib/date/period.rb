# frozen_string_literal: true

require 'date'
require "active_support"
require "active_support/core_ext/class"
require "active_support/core_ext/date"
require "active_support/core_ext/time"
require "active_support/core_ext/integer"
require "active_support/hash_with_indifferent_access"
require "active_support/time_with_zone"

require_relative "period/version"
require_relative "period/class_methods"
require_relative "period/day"
require_relative "period/days"
require_relative "period/week"
require_relative "period/pay_period"
require_relative "period/month"
require_relative "period/quarter"
require_relative "period/year"
require_relative "period/custom"
require_relative "period/date_class_methods"
require_relative "period/date_methods"

class Date
  extend(Date::Period::DateClassMethods)
  include(Date::Period::DateMethods)

  module Period
    class Error < StandardError; end
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
