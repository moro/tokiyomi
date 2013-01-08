# coding: utf-8
require 'active_support/core_ext'

module Tokiyomi
  class RelativeTime
    RELATIVE_TIME = /(\d+)(年|月|日|時間|分|秒)(前|後)(?:の(\d{2}):(\d{2}))?/

    def initialize(str)
      @duration, @unit, @direction, *@offset= str.scan(RELATIVE_TIME).first
    end

    def calculate(base)
      datetime = duration.send(unit).send(direction, base)
      @offset.all?(&:nil?) ? datetime : apply_offset(datetime)
    end

    def duration
      @duration.to_i
    end

    def unit
      {
        '年'    => :years,
        '月'    => :months,
        '日'    => :days,
        '時間'  => :hours,
        '分'    => :minutes,
        '秒'    => :seconds,
      }[@unit]
    end

    def direction
      @direction == '前' ? :ago : :since
    end

    private

    def apply_offset(base)
      hour, min = @offset.map(&:to_i)
      base.change(hour: hour, min: min)
    end
  end
end
