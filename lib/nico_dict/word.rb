require "open-uri"

class NicoDict::Word
  attr_accessor :file
  attr_reader :html

  def initialize file
    @file = file
  end

  def html
    @html ||= Nokogiri::HTML(file.read)
  end

  def title
    el = html.at_css("title") and el.text
  end

  def word
    /^(.+)とは \(/ =~ title
    $1
  end
end
