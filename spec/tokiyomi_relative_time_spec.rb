# coding: utf-8
require 'time'
require 'tokiyomi/relative_time'

describe Tokiyomi::RelativeTime do
  let(:now) { Time.local(2013, 1, 10, 12, 34, 56) }

  def rel_time(str)
    Tokiyomi::RelativeTime.new(str)
  end

  RSpec::Matchers.define :be_calculated_to do |expect|
    match do |relative_time|
      relative_time.calculate(now).should == Time.parse(expect)
    end
  end

  specify  { expect(rel_time('3日前')).to be_calculated_to('2013/01/07 12:34:56') }
end
