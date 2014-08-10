require 'spec_helper'
require 'hooloo/mozart_hash'

describe Hooloo::MozartHash do
  let(:symphony) do
    symphony = Class.new(Hooloo::MozartHash) do
      bool :is_test
      date :date_field
    end
    symphony.new('is_test' => true, 'normal_field' => 'stuff', 'date_field' => '2012-10-05T17:00:00Z')
  end
  it 'should respond properly to bool method' do
    symphony.must_respond_to :is_test?
    symphony.is_test?.must_equal true
  end
  it 'should respond properly to date method' do
    symphony.date_field.must_be_instance_of Date
  end
  it 'should respond properly from hash implicitly' do
    symphony.must_respond_to :normal_field
    symphony.normal_field.must_equal 'stuff'
  end
  it 'should leave off @obj from the inspect method' do
    symphony.inspect.wont_match(/@obj/)
  end
end
