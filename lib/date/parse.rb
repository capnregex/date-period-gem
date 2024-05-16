class Date
  module Parse
    def today
      @today ||= Date.current
    end

    def parse_date(arg)
      case arg
      when Date then arg
      when nil then today
      when String then parse_string(arg)
      when ActionController::Parameters then parse_params(arg)
      when Hash then parse_hash(arg)
      else
        parse_unknown(arg)
      end
    end

    def parse_default
      today
    end

    def parse_params(params)
      parse_hash(params.permit(:date, :today, :start_date).to_h)
    end

    def parse_hash(hash)
      parse_date(hash['date'] || hash['today'] || hash['start_date'])
    end

    def parse_string(string)
      return parse_default if string.blank?

      Date.parse(string)
    end

    def parse_unknown(arg)
      raise ArgumentError, "Unexpected #{arg.class} with value #{arg}" unless arg.respond_to? :to_date

      arg.to_date
    end
  end
end
