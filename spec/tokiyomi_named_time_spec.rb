# coding: utf-8
require 'spec_helper'
require 'tokiyomi/named_time'

describe Tokiyomi::NamedTime do
  let(:now) { Time.local(2013, 1, 10, 12, 34, 56) }

  def named_time(str)
    Tokiyomi::NamedTime.new(str)
  end

  specify  { expect(named_time('昨日')).to      be_calculated_to('2013/01/09 12:34:56') }
  specify  { expect(named_time('おととい')).to  be_calculated_to('2013/01/08 12:34:56') }
  specify  { expect(named_time('今日')).to      be_calculated_to('2013/01/10 12:34:56') }
  specify  { expect(named_time('明後日')).to    be_calculated_to('2013/01/12 12:34:56') }
end
