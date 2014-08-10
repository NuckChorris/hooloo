require 'spec_helper'
require 'hooloo/video'

describe Hooloo::Video do
  let(:video) { Hooloo::Video.new 407993 }
  it 'should split the copyright field on commas' do
    video.copyright.must_be_instance_of Array
    video.copyright.must_include "Reki Kawahara"
  end
end
