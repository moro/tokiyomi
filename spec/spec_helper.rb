def RSpec.root
  @spec_root ||= Pathname.new(File.dirname(__FILE__))
end

$: << File.expand_path('../lib', File.dirname(__FILE__))

RSpec.configure do |config|
  config.mock_with :rspec
end

RSpec::Matchers.define :be_calculated_to do |expect|
  match do |relative_time|
    expect(relative_time.calculate(now)).to eq(Time.parse(expect))
  end
end
require 'time'
