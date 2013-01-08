# coding: utf-8
require 'tokiyomi'

describe Tokiyomi do
  specify { Tokiyomi.parse('10日前').should be_kind_of(Time) }
end
