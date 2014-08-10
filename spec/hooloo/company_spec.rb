require 'spec_helper'
require 'hooloo'

describe Hooloo::Company do
  it 'should list all companies' do
    Hooloo::Company.list.must_be_instance_of Array
    Hooloo::Company.list.each { |x| x.must_be_instance_of Hooloo::Company }
  end
end
