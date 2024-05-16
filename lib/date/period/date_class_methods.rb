class Date
  module Period
    module DateClassMethods
      def pay_period(date=nil)
        Date::Period::PayPeriod.new(date)
      end
    end
  end
end
