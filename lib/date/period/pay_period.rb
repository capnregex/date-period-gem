class Date
  module Period
    class PayPeriod < Base
      # @NOTE: 01/07/2018 is the start_date date for pay periods in 2018
      # 2012 is the first year in the 2000's that starts with the pay period on Jan 1
      # https://www.nfc.usda.gov/Publications/Forms/pay_period_calendar.php
      class_attribute :origin, default: Date.new(2012, 1, 1) # Start of a pay period
      self.unit = :days
      self.duration = 14

      def id
        "#{year}pp#{number}"
      end

      def diff
        @diff ||= date - origin
      end

      def day
        @day ||= (diff % duration).to_i
      end

      def week
        @week ||= day / 7
      end

      def week_id
        "#{id}wk#{week + 1}"
      end

      def index
        @index ||= (diff / duration).to_i
      end

      def start_date
        @start_date ||= date.days_ago(day)
      end

      def end_date
        @end_date ||= start_date.days_since(duration - 1)
      end

      # find the first pay period for this year
      def first
        # Jan 14 is always in the first pay period
        @first ||= start_date.change(month: 1, day: 14).pay_period
      end

      # which pay period for the year this is
      def number
        @number ||= ((start_date - first.start_date) / duration).to_i + 1
      end

      def first_week_end
        @first_week_end ||= start_date + 6.days
      end

      def second_week_start
        @second_week_start ||= start_date + 7.days
      end

      def first_week
        start_date..first_week_end
      end

      def second_week
        second_week_start..end_date
      end

      def weeks
        @weeks ||= [first_week, second_week]
      end

      def start_to_today_range
        start_date..date
      end

      def first_weekdays
        first_week.select(&:on_weekday?)
      end

      def second_weekdays
        second_week.select(&:on_weekday?)
      end

      def weekdays_to_today
        start_to_today_range.select(&:on_weekday?)
      end

      def label
        "Pay Period #{number} of #{year}"
      end

      def short
        "PP#{number}"
      end

      def to_s
        "#{year} Pay Period #{number}"
      end
    end
  end
end
