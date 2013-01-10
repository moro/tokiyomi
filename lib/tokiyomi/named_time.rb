# coding: utf-8
require 'tokiyomi/time_base'

module Tokiyomi
  class NamedTime < TimeBase
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

    def self.readable?(str)
      str.in?(NAMED_TIMES.keys)
    end

    def initialize(str)
      definition = NAMED_TIMES[str]
      @duration   = definition.duration
      @unit       = :days
      @direction  = definition.direction
    end
  end
end
