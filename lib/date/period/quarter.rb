class Date
  module Period
    class Quarter < Base
      self.unit = :months
      self.duration = 3

      def start_date
        @start_date ||= date.beginning_of_quarter
      end

      def end_date
        @end_date ||= date.end_of_quarter
      end
    end
  end
end
