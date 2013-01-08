require 'tokiyomi/version'
require 'tokiyomi/relative_time'

module Tokiyomi
  extend self

  def parse(str)
    RelativeTime.new(str).calculate(Time.now)
  end
end
