class Date
  module Period
    class Year < Base
      self.unit = :years
      self.duration = 1

      def start_date
        @start_date ||= date.beginning_of_year
      end

      def end_date
        @end_date ||= date.end_of_year
      end
    end
  end
end
