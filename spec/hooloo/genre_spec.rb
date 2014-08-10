require 'spec_helper'
require 'hooloo/genre'

describe Hooloo::Genre do
  describe 'List All' do
    let(:genres) { Hooloo::Genre.list }
    it 'should convert genre list to Genre objects' do
      genres.each { |x| x.must_be_instance_of Hooloo::Genre }
    end
  end
  describe 'Shows List' do
    let(:genre) { Hooloo::Genre.new 'anime' }
    it 'should return multiple shows' do
      genre.shows.length.must_be :>, 0
    end
    it 'should convert shows to Show objects' do
      genre.shows.each { |x| x.must_be_instance_of Hooloo::Show }
    end
  end
end
