# coding: utf-8
require 'active_support/core_ext'

module Tokiyomi
  class RelativeTime
    UNITS = {
        '年'    => :years,
        '月'    => :months,
        '日'    => :days,
        '時間'  => :hours,
        '分'    => :minutes,
        '秒'    => :seconds,
    }.freeze

    RELATIVE_TIME = /(\d+)(#{UNITS.keys.join('|')})(前|後)(?:の(\d{2}):(\d{2}))?/

    def self.readable?(str)
      str =~ RELATIVE_TIME
    end

    attr_reader :duration, :unit, :direction, :hour_min

    def initialize(str)
      raise ArgumentError, "can't understand `#{str}'" unless self.class.readable?(str)

      init_from_dynamic_value(str)
    end

    def calculate(base)
      datetime = duration.send(unit).send(direction, base)

      hour_min_fixable? ? datetime.change(hour_min) : datetime
    end

    private

    def hour_min_fixable?
      hour_min && unit.in?([:years, :months, :days])
    end

    def init_from_dynamic_value(str)
      duration, unit, direction, *hour_min= str.scan(RELATIVE_TIME).first

      @duration   = duration.to_i
      @unit       = UNITS[unit]
      @direction  = direction == '前' ? :ago : :since
      @hour_min   = hour_min.all?(&:nil?) ? nil : Hash[[:hour, :min].zip(hour_min.map(&:to_i))]
    end
  end
end
