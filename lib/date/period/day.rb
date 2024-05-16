require_relative "base"

class Date
  module Period
    class Day < Base
      self.unit = :days
      self.duration = 1
    end
  end
end
