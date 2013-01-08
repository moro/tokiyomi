require 'active_support/core_ext'

module Tokiyomi
  class RelativeTime
    def initialize(str)
    end

    def calculate(base)
      3.days.ago(base)
    end
  end
end
