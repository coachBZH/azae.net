# encoding: utf-8
# The above is a 'magic encoding' that ensures support for special characters
# like umlauts in strings contained in this file.

module Jekyll
  module Tags
    class CardTag < Liquid::Tag

      def initialize(tag_name, card, tokens)
        @card = card
        super
      end

      def render(context)
        site = context.registers[:site]
        "<a href='/cards/#{@card}'>#{@card}</a>"
      end
    end
  end
end

Liquid::Template.register_tag('card', Jekyll::Tags::CardTag)