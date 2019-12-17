# frozen_string_literal: true

module RailsParseHead
  class Parse < Base
    def initialize(html)
      @html = document(html)
    end
  end
end
