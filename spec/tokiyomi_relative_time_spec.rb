# coding: utf-8
require 'spec_helper'
require 'tokiyomi/relative_time'

describe Tokiyomi::RelativeTime do
  let(:now) { Time.local(2013, 1, 10, 12, 34, 56) }

  def rel_time(str)
    Tokiyomi::RelativeTime.new(str)
  end

  specify  { expect(rel_time('3日前')).to be_calculated_to('2013/01/07 12:34:56') }
  specify  { expect(rel_time('10分後')).to be_calculated_to('2013/01/10 12:44:56') }

  specify  { expect(rel_time('2日後の20:00')).to be_calculated_to('2013/01/12 20:00:00') }

  specify { expect { rel_time('いつか').to raise_error(ArgumentError) } }
  specify { expect { rel_time('1日後の10:').to raise_error(ArgumentError) } }
end
