class Feed
  attr_accessor :existing_feed, :episodes, :audio_url, :guid, :enhancements

  MALFORMED_AUDIO_URL_PATH = "http://s3.aws.com/malformed_audio_url.mp3"

  def initialize
  end

  # Command methods that set attributes for dynamic render
  def with_episodes(count:)
    self.episodes = count
    self
  end

  def malformed_audio
    self.audio_url = MALFORMED_AUDIO_URL_PATH
    self
  end

  def without_guids
    self.guid = :null
    self
  end

  def duplicate_guids
    self.guid = :duplicate
    self
  end

  def enhanced_episode_tags
    self.enhancements = :enhanced_episode_tags
    self
  end

  # Kill params after use, if not dynamically assigned
  # TODO(@dain): Better method name
  def build_state params

    if params[:existing_feed]
      self.existing_feed = true
      for param in params
        params.delete(param)
      end
    end

    if params[:eps]
      self.with_episodes(count: params[:eps].to_i)
      params.delete(:eps)
    end

    for feed_option in params
      self.send(feed_option[0]) if self.respond_to? feed_option[0]
    end
  end

  private
  def method_missing method_name, *args, &block
    puts "Method missing called"
  end
end
