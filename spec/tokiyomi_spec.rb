# coding: utf-8
require 'tokiyomi'

describe Tokiyomi do
  specify { expect(Tokiyomi.parse('10日前')).to be_kind_of(Time) }

  describe '.readable?' do
    specify { expect(Tokiyomi.readable?('10日前')).to be_truthy }
    specify { expect(Tokiyomi.readable?('日後')).to be_falsey }
    specify { expect(Tokiyomi.readable?('おっととい')).to be_falsey }
    specify { expect(Tokiyomi.readable?('おととい')).to be_truthy }
  end
end
