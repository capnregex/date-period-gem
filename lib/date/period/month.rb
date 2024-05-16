class Date
  module Period
    class Month < Base
      self.unit = :months
      self.duration = 1

      def start_date
        @start_date ||= date.beginning_of_month
      end

      def end_date
        @end_date ||= date.end_of_month
      end

      def name
        date.strftime("%B")
      end

      def abbr
        date.strftime("%b")
      end

      def to_s
        date.strftime("%B %Y")
      end
    end
  end
end
