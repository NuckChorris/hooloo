class Hooloo::Show < Hooloo::MozartHash
  def self.popular_today(args={limit: 10, position: 0})
    args.merge!({sort: 'popular_today'})
    Hooloo.request('shows', args)['data'].map { |x| new x['show'] }
  end
  def initialize(id)
    super
    if id.is_a? Fixnum
      @obj = Hooloo.request("shows/#{id}")['data'][0]['show']
    end
  end
  def videos(season=1)
    Hooloo.request("shows/#{id}/episodes", {
      items_per_page: 128,
      season_number: season
    })['data'].map { |x| Hooloo::Video.new x['video'] }
  end
  bool :embed_permitted, :has_captions
  date :cache_time
  cast Hooloo::Company, :company
  cast Hooloo::Rollup, {rollups: :show_rollups}, {map: true}
end
