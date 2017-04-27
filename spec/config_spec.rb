require 'spec_helper'

RSpec.describe AmpValidator::Config do
  it 'is created' do
    config = AmpValidator::Config.new
    expect(config).not_to be nil
  end

  it 'loads config' do
    config = AmpValidator::Config.new
    expect(config.data).not_to be nil
  end
end
