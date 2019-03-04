class Feed
  attr_accessor :existing_feed, :episodes, :duplicate_guid, :empty_guid, :malformed_audio

  def initialize options
    @options = options
  end

  def generate!

    if @options[:existing_feed]
      existing_feed = true
    end

    if @options[:episodes]
      create_episodes_for(count: @options[:episodes])
    end

    if self.episodes

      if @options[:empty_guid]
        self.episodes.each { |e| e.empty_guid = true}
      end

      # if @params[:duplicate_guid]
      #   duplicate_guid = true
      # end
      #
      # if @params[:malformed_audio]
      #   if @params[:eps]
      #     malformed_audio = true
      #   end
      # end
    end

    self
  end

  private
  def create_episodes_for(count:)
    self.episodes = (1..count).map { Episode.new }
  end

end
