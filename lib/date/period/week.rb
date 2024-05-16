class Date
  module Period
    class Week < Base
      self.unit = :days
      self.duration = 7

      def start_date
        @start_date ||= date.beginning_of_week(:sunday)
      end

      def end_date
        @end_date ||= date.end_of_week(:sunday)
      end
    end
  end
end
