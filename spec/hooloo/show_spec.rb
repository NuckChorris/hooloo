require 'spec_helper'
require 'hooloo/show'

describe Hooloo::Show do
  describe 'Popular Today' do
    let(:shows) { Hooloo::Show.popular_today }
    it 'should retrieve popular_today' do
      shows.length.must_equal 10
    end
  end
  describe 'Loading' do
    let(:show) { Hooloo::Show.popular_today[0] }
    it 'should convert cache_time to a Time object' do
      show.cache_time.must_be_instance_of Time
    end
    it 'should convert company to a Company object' do
      show.company.must_be_instance_of Hooloo::Company
    end
    it 'should convert rollups to Rollup objects' do
      show.rollups.each { |x| x.must_be_instance_of Hooloo::Rollup }
    end
    it 'should convert videos to Video objects' do
      show.videos.each { |x| x.must_be_instance_of Hooloo::Video }
    end
  end
end
