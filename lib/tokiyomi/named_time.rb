# coding: utf-8
require 'active_support/core_ext'

module Tokiyomi
  class NamedTime
    Definition = Struct.new(:duration, :direction)

    NAMED_TIMES = {
      'おととい'  => Definition.new(2, :ago),
      '一昨日'    => Definition.new(2, :ago),
      '昨日'      => Definition.new(1, :ago),
      '今日'      => Definition.new(0, :ago),
      '明日'      => Definition.new(1, :since),
      '明後日'    => Definition.new(2, :since),
      'あさって'  => Definition.new(2, :since),
    }.freeze

    attr_reader :duration, :unit, :direction, :hour_min

    def self.readable?(str)
      str.in?(NAMED_TIMES.keys)
    end

    def initialize(str)
      definition = NAMED_TIMES[str]
      @duration   = definition.duration
      @unit       = :days
      @direction  = definition.direction
    end

    def calculate(base)
      duration.send(unit).send(direction, base)
    end
  end
end
