class Hooloo::Genre < Hooloo::MozartHash
  def initialize(obj)
    super
    if obj.is_a? String
      @obj = {'canonical_name' => obj}
    else
      @obj = obj
    end
  end
  # List all shows in this genre
  #
  # @param args [Hash] (see Hooloo#request)
  # @return [Enumerator<Hooloo::Show>] List of shows
  def shows(args={})
    Hooloo.paginated_request('shows', {
      genre: canonical_name,
      sort: 'release_with_popularity'
    }.merge(args), 100) { |g, x| g << Hooloo::Show.new(x['show']) }
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
