require 'spec_helper'
RSpec.describe ::AmpValidator::Rules::MetaCharsetFirstInHead do
  it 'answers invalid' do
    rule_set = ::AmpValidator::Rules::MetaCharsetFirstInHead.new
    valid = rule_set.valid?(Nokogiri::HTML('<html></html>'))
    expect(valid).to be false
  end

  it 'answers valid' do
    rule_set = ::AmpValidator::Rules::MetaCharsetFirstInHead.new
    valid = rule_set.valid?(Nokogiri::XML('<html><head><meta charset="utf-8"></head></html>'))
    expect(valid).to be true
  end

  it 'should fix error on valid' do
    rule_set = ::AmpValidator::Rules::MetaCharsetFirstInHead.new
    result = rule_set.process(Nokogiri::HTML('<html><head></head></html>'))
    p result
  end
end
