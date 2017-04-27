require 'yaml'

module AmpValidator
  class Config
    attr_accessor :data

    def initialize(opts = {})
      @data = YAML.load_file(opts.fetch('filename', '.amprules.yml'))
    end
  end
end
