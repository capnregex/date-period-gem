require_relative "../parse.rb"
class Date
  module Period
    class Base
      include Comparable
      # include Draper::Decoratable
      include Parse
      class_attribute :unit, default: :days
      class_attribute :duration, default: 1

      delegate :new, to: :class
      delegate :year, to: :start_date

      # rubocop:disable Lint/UnusedMethodArgument
      def initialize(date=nil, duration: nil, end_date: nil)
        @date = parse_date(date)
      end
      # rubocop:enable Lint/UnusedMethodArgument

      def today
        @today ||= Date.current
      end

      def date
        @date ||= today
      end

      def <=>(other)
        other&.start_date <=> start_date
      end

      def start_date
        @start_date ||= date
      end

      def end_date
        @end_date ||= date
      end

      def parse_default
        start_date
      end

      def to_s
        "#{self.class.name} starting #{start_date}"
      end

      def next
        new(date.advance(unit => duration))
      end

      def prev
        new(date.advance(unit => -duration))
      end

      def get_day(index)
        if index.negative?
          end_date.days_since(index + 1)
        else
          start_date.days_since(index)
        end
      end

      def advance(offset)
        start_date.advance(offset.symbolize_keys.transform_values(&:to_i))
      end

      def date_range
        start_date..end_date
      end

      def days
        @days || date_range.to_a
      end

      def weekdays
        date_range.select(&:on_weekday?)
      end

      def start_time
        start_date.in_time_zone
      end

      def end_time
        end_date.in_time_zone.end_of_day
      end

      def time_range
        start_time..end_time
      end
      delegate :cover?, to: :time_range

      def beginning?(arg=nil)
        parse_date(arg || date) == start_date
      end

      def days_to_start(arg=nil)
        parse_date(arg || date) - start_date
      end

      def days_to_end(arg=nil)
        end_date - parse_date(arg || date)
      end

      def weeks_to_start(arg=nil)
        (days_to_start(arg) / 7).floor
      end

      def next_start_date
        @next_start_date ||= start_date + duration.days
      end

      def prev_start_date
        @prev_start_date ||= start_date - duration.days
      end

      def sunday
        @sunday ||= start_date.beginning_of_week(:sunday)
      end

      def saturday
        @saturday ||= end_date.end_of_week(:sunday)
      end

      def holidays
        @holidays ||= FederalHoliday.after(sunday).before(saturday)
      end
    end
  end
end
