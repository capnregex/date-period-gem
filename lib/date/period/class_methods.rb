class Date
  module Period
    module ClassMethods
      def find(unit)
        UNITS[unit] || Month
      end

      def new(unit, date)
        find(unit).new(date)
      end
    end
  end
end
