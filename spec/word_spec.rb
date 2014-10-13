require 'spec_helper'
require 'nico_dict'

describe NicoDict::Word do
  before do
    @file = open('./spec/yamanosusume.html')
    @word = NicoDict::Word.new(@file)
  end

  it do
    expect(@word.word).to eq("ヤマノススメ")
  end

  describe do
    before do
      @file = open('./spec/kancolle_redirection.html')
      @word = NicoDict::Word.new(@file)
    end

    it do
      path = "/a/%E8%89%A6%E9%9A%8A%E3%81%93%E3%82%8C%E3%81%8F%E3%81%97%E3%82%87%E3%82%93%E3%80%9C%E8%89%A6%E3%81%93%E3%82%8C%E3%80%9C"
      expect(@word.redirect_path).to eq(path)
    end
  end
end
