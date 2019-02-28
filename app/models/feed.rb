class Feed
  attr_accessor :existing_feed, :episodes, :duplicate_guid, :empty_guid, :malformed_audio

  def with_episodes(count:)
    self.episodes = count
  end

  private
  def build_state_from_url params

    if params[:existing_feed]
      self.existing_feed = true
    end

    if params[:eps]
      self.episodes = params[:eps]
    end

    if params[:duplicate_guid]
      self.duplicate_guid = true
    end

    if params[:empty_guid]
      self.empty_guid = true
    end

    if params[:malformed_audio]
      self.malformed_audio = true
    end
  end

end
