# coding: utf-8
require 'active_support/core_ext'

module Tokiyomi
  class RelativeTime
    RELATIVE_TIME = /(\d+)(年|月|日|時間|分|秒)(前|後)/

    def initialize(str)
      @duration, @unit, @direction = str.scan(RELATIVE_TIME).first
    end

    def calculate(base)
      duration.send(unit).send(direction, base)
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
  end
end
