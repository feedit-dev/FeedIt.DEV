class Feed
  attr_accessor :existing_feed, :episodes, :duplicate_guid, :empty_guid, :malformed_audio, :email, :title

  def initialize options
    @options = options
  end

  def generate!
    render_existing_feed   if @options[:existing_feed]
    render_email           if @options[:email]
    render_title           if @options[:title]
    create_episodes        if @options[:episodes]
    self
  end

  private
  def render_existing_feed
    self.existing_feed = true
  end

  def create_episodes
    self.episodes ||= (1..@options[:episodes]).map { Episode.new }

    add_empty_guids_to_episodes     if self.episodes and @options[:empty_guid]
    add_duplicate_guids_to_episodes if self.episodes and @options[:duplicate_guid]
    add_malformed_audio_to_episodes if self.episodes and @options[:malformed_audio]
  end

  def add_empty_guids_to_episodes
    self.episodes.each { |e| e.empty_guid = true }
  end

  def add_duplicate_guids_to_episodes
    self.episodes.each { |e| e.duplicate_guid = true }
  end

  def add_malformed_audio_to_episodes
    self.episodes.each { |e| e.malformed_audio = true }
  end

  def render_email
    self.email = @options[:email]
  end
  
  def render_title
    self.title = @options[:title]
  end
end
