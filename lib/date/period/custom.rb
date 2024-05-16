class Date
  module Period
    class Custom < Base
      self.unit = :days
      self.duration = 5

      def initialize(date=nil, duration: nil, end_date: nil)
        super
        return unless end_date

        @end_date = parse_date(end_date)
        @duration = (@end_date - @date) + 1
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
