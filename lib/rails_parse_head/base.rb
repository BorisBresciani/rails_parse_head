# frozen_string_literal: true

require 'nokogiri'
require 'http'

module RailsParseHead
  class Base
    attr_accessor :html

    def title
      title = html.at_css('title')
      title.nil? ? '' : title.text
    end

    def metas
      html.css('meta').map do |node|
        {
          name: node['name'],
          property: node['property'],
          content: node['content'],
          itemprop: node['itemprop'],
          description: node['description'],
          class: node['class'],
          charset: node['charset']
        }.compact
      end
    end

    def links
      html.css('link').map do |node|
        {
          rel: node['rel'],
          href: node['href'],
          type: node['type'],
          title: node['title'],
          sizes: node['sizes'],
          hreflang: node['hreflang']
        }.compact
      end
    end

    private

    def document(node)
      Nokogiri::HTML(node)
    end
  end
end
