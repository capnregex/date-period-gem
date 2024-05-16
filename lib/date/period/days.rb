class Date
  module Period
    class Days < Base
      self.unit = :days
      self.duration = 5

      def initialize(date=nil, duration: nil, end_date: nil)
        super
        @duration = duration
      end

      def end_date
        @end_date ||= start_date.advance(days: duration - 1)
      end

      def duration
        @duration ||= self.class.duration
      end
    end
  end
end
