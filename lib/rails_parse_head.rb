# frozen_string_literal: true

require 'rails_parse_head/version'
require 'rails_parse_head/base'
require 'rails_parse_head/fetch'
require 'rails_parse_head/parse'

module RailsParseHead
  class << self
    def parse(element)
      RailsParseHead::Parse.new(element)
    end

    def fetch(url, options = {})
      RailsParseHead::Fetch.new(url, options)
    end
  end
end
