class Date
  module Period
    module DateMethods
      def period(unit, duration: nil, end_date: nil)
        Date::Period.find(unit).new(self, duration: duration, end_date: end_date)
      end

      def pay_period
        @pay_period ||= Date::Period::PayPeriod.new(self)
      end
    end
  end
end
