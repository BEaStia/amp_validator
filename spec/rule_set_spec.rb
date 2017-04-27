RSpec.describe AmpValidator::RuleSet do
  it 'is created' do
    rule_set = AmpValidator::RuleSet.new
    expect(rule_set).not_to be nil
  end

  it 'loads config' do
    rule_set = AmpValidator::RuleSet.new
    expect(rule_set.config).not_to be nil
  end

  it 'loads enabled rules from config' do
    rule_set = AmpValidator::RuleSet.new
    expect(rule_set.enabled_rules).not_to be nil
  end
end
