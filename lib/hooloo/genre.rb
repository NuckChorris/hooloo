class Hooloo::Genre < Hooloo::MozartHash
  def initialize(obj)
    super
    if obj.is_a? String
      @obj = {canonical_name: obj}
    else
      @obj = obj
    end
  end
  def shows(args={items_per_page: 10, position: 0})
    args.merge!({genre: canonical_name})
    Hooloo.request('shows', args)['data'].map { |x| Hooloo::Show.new x['show'] }
  end
  # List all genres known to Hulu
  #
  # @param args [Hash] (see Hooloo#request)
  # @return [Array<Hooloo::Genre>] List of genres
  def self.list(args={})
    Hooloo.request("shows/genres")['data'].map do |item|
      Hooloo::Genre.new(item['genre'])
    end
  end
end
