require 'spec_helper'
require 'nico_dict'

describe NicoDict::Word do
  before do
    @file = open('./spec/yamanosusume.html')
    @word = NicoDict::Word.new(@file)
  end

  it do
    raise Exception, @word.title
  end
end