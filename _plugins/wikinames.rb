# encoding: utf-8
# The above is a 'magic encoding' that ensures support for special characters
# like umlauts in strings contained in this file.

require 'jekyll'

module Jekyll
  class CardLink < Jekyll::Generator

    safe true

    def initialize(config)
    end

    def generate(site)
      @site = site
      #@cards = Hash[ site.collections['cards'].docs.map { |page| [ page.basename_without_ext, page.data['title'] ] } ]
      site.collections['cards'].docs.each { |page| autolinkify page }
    end

    private

    def autolinkify(page)
      page.content = page.content.gsub(/~(\w+)/) do |value|
        ref = Regexp.last_match[1]
        #name = @cards[ref]
        if not name.nil? then
          "<a href='/cards/#{ref}'>#{ref}</a>"
        else
          raise ArgumentError.new "Could not find card '#{ref}', Make sure the card exists and the name is correct."
        end
      end
    end
  end
end