require 'tokiyomi/version'
require 'tokiyomi/relative_time'

module Tokiyomi
  extend self

  def parse(str)
    RelativeTime.new(str.encode('UTF-8')).calculate(Time.now)
  end
end
