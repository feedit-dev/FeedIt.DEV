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

  private
  def method_missing method_name, *args, &block
  end
end
