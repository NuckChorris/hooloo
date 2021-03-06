class Hooloo::Video < Hooloo::MozartHash
  # @param id [Fixnum]
  def initialize(id)
    super
    if id.is_a? Fixnum
      @obj = Hooloo.request("videos/#{id}")['data'][0]['video']
    end
  end
  def oembed
    Hooloo.request '/api/oembed.json', url: "http://www.hulu.com/watch/#{@obj['id']}"
  end
  def copyright
    @obj['copyright'].split(',').map(&:strip)
  end
  date :available_at, :cache_time, :original_premiere_date, :released_at
  bool :embed_permitted, :has_captions, :has_hd, :is_auth_valid, :is_expiring, :is_html5_enabled,
       :is_mature, :is_subscriber_only, :is_web_only
  float :duration
  uri :thumbnail_url
end
