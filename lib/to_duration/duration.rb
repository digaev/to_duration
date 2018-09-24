module ToDuration
  class Duration
    UNITS = {
      years: 315_576_00,
      months: 259_200_0,
      weeks: 604_800,
      days: 864_00,
      hours: 3600,
      minutes: 60,
      seconds: 1
    }.freeze

    attr_reader :seconds

    def initialize(seconds)
      @seconds = Integer(seconds)
    end

    def years
      seconds / UNITS[:years]
    end

    def months
      seconds / UNITS[:months]
    end

    def weeks
      seconds / UNITS[:weeks]
    end

    def days
      seconds / UNITS[:days]
    end

    def hours
      seconds / UNITS[:hours]
    end

    def minutes
      seconds / UNITS[:minutes]
    end

    def add(unit, count)
      @seconds += UNITS[unit] * count
    end

    def sub(unit, count)
      @seconds -= UNITS[unit] * count
    end

    def to_s(options = {})
      return ToDuration.t('less_than_one_second') if seconds < 1

      units = to_units(options).map do |k, v|
        "#{v} #{ToDuration.t(k.to_s.chop, count: v)}"
      end

      units.join(', ').tap do |s|
        s.gsub!(/,([^,]*)$/, " #{ToDuration.t('and')}\\1") if units.length > 1
      end
    end

    def to_units(options = {})
      options = { weeks: false }.merge!(options)
      duration = Duration.new(seconds)

      {}.tap do |units|
        UNITS.keys.each do |k|
          next if options.key?(k) && options[k] != true

          count = duration.public_send(k)
          next if count.zero?

          units[k] = count
          duration.sub(k, count)
        end
      end
    end
  end
end
