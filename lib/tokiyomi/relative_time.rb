# coding: utf-8
require 'tokiyomi/time_base'

module Tokiyomi
  class RelativeTime < TimeBase
    UNITS = {
        '年'    => :years,
        '月'    => :months,
        '日'    => :days,
        '週間'  => :weeks,
        '時間'  => :hours,
        '分'    => :minutes,
        '秒'    => :seconds,
    }.freeze

    RELATIVE_TIME = /(\d+)(#{UNITS.keys.join('|')})(前|後)(?:の(\d{2}):(\d{2}))?/

    def self.readable?(str)
      str =~ RELATIVE_TIME
    end

    def initialize(str)
      raise ArgumentError, "can't understand `#{str}'" unless self.class.readable?(str)

      duration, unit, direction, *hour_min= str.scan(RELATIVE_TIME).first

      @duration   = duration.to_i
      @unit       = UNITS[unit]
      @direction  = direction == '前' ? :ago : :since
      @hour_min   = hour_min.all?(&:nil?) ? nil : Hash[[:hour, :min].zip(hour_min.map(&:to_i))]
    end

    def calculate(base)
      datetime = super

      hour_min_fixable? ? datetime.change(hour_min) : datetime
    end

    private

    def hour_min_fixable?
      hour_min && unit.in?([:years, :months, :weeks, :days])
    end
  end
end
