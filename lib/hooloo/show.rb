class Hooloo::Show < Hooloo::MozartHash
  def self.popular_today(args={})
    Hooloo.paginated_request('shows', {
      sort: 'popular_today'
    }.merge(args), 30) { |g, x| g << Hooloo::Show.new(x['show']) }
  end
  def initialize(id)
    super
    if id.is_a? Fixnum
      @obj = Hooloo.request("shows/#{id}")['data'][0]['show']
    elsif id.is_a? Hash
      @obj = id
    end
  end
  def videos(season=1, args={})
    Hooloo.paginated_request("shows/#{id}/episodes", {
      season_number: season
    }.merge(args), 30) { |g, x| g << Hooloo::Video.new(x['video']) }
  end
  bool :embed_permitted, :has_captions
  date :cache_time
  cast Hooloo::Company, :company
  cast Hooloo::Rollup, {rollups: :show_rollups}, {map: true}
end
