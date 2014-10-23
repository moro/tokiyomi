require 'active_support/core_ext'

module Tokiyomi
  class TimeBase
    attr_reader :duration, :unit, :direction, :hour_min

    class << self
      def readable?(str)
        !!handlable_subclass(str)
      end

      def parser_for(str)
        handlable_subclass(str).new(str)
      end

      private

      def handlable_subclass(str)
        subclasses.detect {|klass| klass.readable?(str) }
      end
    end

    def calculate(base)
      duration.__send__(unit).__send__(direction, base)
    end
  end
end
