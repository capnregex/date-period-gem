class Date
  module ClassMethods
    def pay_period(date=nil)
      Date::Period::PayPeriod.new(date)
    end
  end
end
