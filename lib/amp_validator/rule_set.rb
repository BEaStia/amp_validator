require_relative 'config'
require 'inflecto'

Dir.glob('lib/amp_validator/rules/*.rb') do |file|
  require_relative File.join('..', '..', file)
end

module AmpValidator
  class RuleSet
    RULES = %i[doctype special_html_tag contains_head_tag contains_body_tag
        meta_charset_first_in_head contains_canonical_link
        meta_viewport_in_head amp_script_in_head boilerplate_in_head
        no_img no_audio no_iframe no_frame no_frameset no_object
        no_param no_applet no_embed correct_script correct_link
        correct_meta correct_a_href no_comments no_inline_styles
        no_on_attributes no_xml_related_attributes
        no_i_amp_prefixed_attributes].freeze

    attr_accessor :config, :enabled_rules, :disabled_rules
    def initialize(opts = {})
      @config = Config.new(opts)
      @enabled_rules = Hash[@config.data['enabled_rules'].map do |file_name|
        require_relative "rules/#{file_name}"
        [
          file_name,
          ::Inflecto.constantize((::Inflecto.camelize("amp_validator/rules/#{file_name}"))).new
        ]
      end]
      @disabled_rules = @config.data['disabled_rules']
    end

    def valid?(page)
      @enabled_rules.reduce(true){|result, x| result and x.valid?(page) }
    end

    def process(page)
      @enabled_rules.reduce(page){|result, x| x.process(result) }
    end
  end
end

