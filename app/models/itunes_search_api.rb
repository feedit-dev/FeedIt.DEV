class PodcastSearchApi

  def initialize name
    @base_url = "URL HERE"
    v = HTTParty.get(URL).body
    v = JSON.parse(v)
  end

  def episode_title_one
    v.episodes.first.title
  end

  def episode_title_two
    v.episodes.second.title
  end
end
