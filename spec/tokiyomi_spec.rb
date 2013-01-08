# coding: utf-8
require 'tokiyomi'

describe Tokiyomi do
  specify { Tokiyomi.parse('10日前').should be_kind_of(Time) }

  describe '.readable?' do
    specify { Tokiyomi.readable?('10日前').should be_true }
    specify { Tokiyomi.readable?('日後').should be_false }
    specify { Tokiyomi.readable?('おっととい').should be_false }
    specify { Tokiyomi.readable?('おととい').should be_true }
  end
end
