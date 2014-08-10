class Hooloo::Video < Hooloo::MozartHash
  def initialize(id)
    super
    if id.is_a? Fixnum
      @obj = Hooloo.request("videos/#{id}")['data'][0]['video']
    end
  end
  def copyright
    @obj['copyright'].split(',').map(&:strip)
  end
  date :available_at, :cache_time, :original_premiere_date, :released_at
  bool :embed_permitted, :has_captions, :has_hd, :is_auth_valid, :is_expiring, :is_html5_enabled,
       :is_mature, :is_subscriber_only, :is_web_only
  cast Float, :duration
  cast URI, :thumbnail_url
end
