require 'spec_helper'
require 'hooloo'

describe Hooloo do
  it 'should fetch three tokens' do
    Hooloo.tokens.length.must_equal 3
  end
end
