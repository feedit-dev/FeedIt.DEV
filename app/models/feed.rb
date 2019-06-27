class Feed
  attr_accessor :existing_feed,  :episodes, :duplicate_guid,
                :empty_guid, :malformed_audio, :email, :type,
                :title, :description, :author, :explicit, :category,
                :random_email, :no_email

  def initialize options
    @options = options
  end

  def generate!
    render_existing_feed   if @options[:existing_feed]
    render_email           if @options[:email]
    render_title           if @options[:title]
    render_description     if @options[:description]
    render_author          if @options[:author]
    render_explicit        if @options[:explicit]
    render_category        if @options[:category]
    render_type            if @options[:type]
    render_random_email    if @options[:random_email]
    render_no_email        if @options[:no_email]
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

  def render_description
    self.description = @options[:description]
  end

  def render_author
    self.author = @options[:author]
  end

  def render_explicit
    self.explicit = @options[:explicit]
  end

  def render_category
    self.category = @options[:category]
  end

  def render_type
    self.type = @options[:type]
  end

  def render_random_email
    self.random_email = "#{SecureRandom.hex}@gmail.com"
  end

  def render_no_email
    self.no_email = @options[:no_email]
  end
end
