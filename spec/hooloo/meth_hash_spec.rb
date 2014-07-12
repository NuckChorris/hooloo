require 'spec_helper'
require 'hooloo/meth_hash'

describe Hooloo::MethHash do
  let(:blue_sky) {
    klass = Class.new do
      include Hooloo::MethHash
      def initialize(o)
        @obj = o
      end
    end
    klass.new('is_test' => true, 'normal_field' => 'stuff')
  }
  it 'should respond to question method' do
    blue_sky.must_respond_to :is_test?
    blue_sky.is_test?.must_equal true
  end
  it 'should respond to normal (field) method' do
    blue_sky.must_respond_to :normal_field
    blue_sky.normal_field.must_equal 'stuff'
  end
end
