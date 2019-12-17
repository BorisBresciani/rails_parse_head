# frozen_string_literal: true

module RailsParseHead
  class Fetch < Base
    CONTENT_TYPES = %w[text/html text/plain].freeze

    def initialize(url, options = {})
      @html = document(request(url, options))
    end

    private

    def request(url, options = {})
      response = HTTP.get(url, options)
      return unless content_type_valid?(response.mime_type)
      response.body.to_s
    end

    def content_type_valid?(content_type)
      CONTENT_TYPES.include?(content_type)
    end
  end
end
