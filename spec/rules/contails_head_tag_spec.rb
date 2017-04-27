require 'spec_helper'
RSpec.describe ::AmpValidator::Rules::ContainsHeadTag do
  it 'answers invalid' do
    rule_set = ::AmpValidator::Rules::ContainsHeadTag.new
    valid = rule_set.valid?(Nokogiri::HTML('<html></html>'))
    expect(valid).to be false
  end

  it 'answers invalid' do
    rule_set = ::AmpValidator::Rules::ContainsHeadTag.new
    valid = rule_set.valid?(Nokogiri::HTML('<html><head></head></html>'))
    expect(valid).to be true
  end

  it 'should raise error on valid' do
    rule_set = ::AmpValidator::Rules::ContainsHeadTag.new
    expect {
      rule_set.process(Nokogiri::HTML('<html></html>'))
    }.to raise_error(::AmpValidator::BasicRuleViolated)
  end
end
