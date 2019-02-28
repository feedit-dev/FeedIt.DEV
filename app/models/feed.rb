class Feed
  attr_accessor :existing_feed, :episodes, :duplicate_guid, :empty_guid, :malformed_audio

  def initialize ; end

  def build_state_from_url params

    if params[:existing_feed]
      self.existing_feed = true
    end

    if params[:eps]
      self.episodes = episodes_for(count: params[:eps])
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

  private
  def episodes_for(count:)
    (1..count).map { Episode.new }
  end
end
