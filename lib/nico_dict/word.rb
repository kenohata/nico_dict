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

  def meta_refresh
    html.at_css("meta[http-equiv=refresh]")
  end

  def redirect_path
    regexp  = /^1;URL=http:\/\/dic.nicovideo.jp(.*)$/

    if content = meta_refresh["content"] and md = regexp.match(content)
      md[1]
    end
  end

  def article
    el = html.at_css("#article") and el.text
  end
end
