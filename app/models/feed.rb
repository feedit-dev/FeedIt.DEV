class Feed
  attr_accessor :existing_feed, :episodes, :duplicate_guid, :empty_guid, :malformed_audio

  def initialize options
    @options = options
  end

  def generate!
    render_existing_feed            if @options[:existing_feed]
    create_episodes                 if @options[:episodes]
    add_empty_guids_to_episodes     if @options[:empty_guid]
    add_duplicate_guids_to_episodes if @options[:duplicate_guid]
    add_malformed_audio_to_episodes if @options[:malformed_audio]

    self
  end

  private
  def render_existing_feed
    existing_feed = true
  end

  def create_episodes
    self.episodes ||= (1..@options[:episodes]).map { Episode.new }
  end

  def add_empty_guids_to_episodes
    if self.episodes
      self.episodes.each { |e| e.empty_guid = true }
    end
  end

  def add_duplicate_guids_to_episodes
    if self.episodes
      if @options[:duplicate_guid]
        self.episodes.each { |e| e.duplicate_guid = true }
      end
    end
  end

  def add_malformed_audio_to_episodes
    if self.episodes
      if @options[:malformed_audio]
        self.episodes.each { |e| e.malformed_audio = true }
      end
    end
  end

end
