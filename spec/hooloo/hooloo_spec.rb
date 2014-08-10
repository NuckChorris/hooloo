require 'spec_helper'
require 'hooloo'

describe Hooloo do
  it 'should fetch three tokens' do
    Hooloo.tokens.length.must_equal 3
  end
  it 'should cache the tokens in memory' do
    tokens = Hooloo.tokens
    Hooloo.tokens.must_equal tokens
  end
  it 'should refresh tokens when we tell it to' do
    Hooloo.tokens!.length.must_equal 3
  end
end
