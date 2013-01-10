require 'tokiyomi/version'
require 'tokiyomi/relative_time'
require 'tokiyomi/named_time'

module Tokiyomi
  extend self

  def parse(str)
    TimeBase.parser_for(str.encode('UTF-8')).calculate(Time.now)
  end

  def readable?(str)
    TimeBase.readable?(str)
  end
end
