module ToDuration
  class Converter
    def self.call(value, options = {})
      new(value, options).call
    end

    def initialize(value, options = {})
      @value = value
      @options = DEFAULTS.dup.merge!(options).freeze
    end

    def call
      units = to_units
      last = if units.length > 1
               " #{I18n.t('to_duration.and')} #{units.pop}"
             else
               ''
             end
      "#{units.join(', ')}#{last}"
    end

    private

    UNITS = {
      year: 315_576_00,
      month: 259_200_0,
      week: 604_800,
      day: 864_00,
      hour: 3600,
      minute: 60,
      second: 1
    }.freeze

    DEFAULTS = {
      year: true,
      month: true,
      week: false,
      day: true,
      hour: true,
      minute: true,
      second: true
    }.freeze

    def to_units
      seconds = @value

      UNITS.map do |k, v|
        next if @options[k] != true

        count = seconds >= v ? seconds / v : 0
        seconds -= count * v

        t_unit(k, count) if count > 0
      end.compact!
    end

    def t_unit(unit, count)
      "#{count} #{I18n.t("to_duration.#{unit}", count: count)}"
    end
  end
end
