class Feed
  attr_accessor :episodes, :audio_url, :guid

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

  def with_duplicate_guids
    self.guid = :duplicate
    self
  end


end
