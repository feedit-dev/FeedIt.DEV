class FeedsController < ApplicationController
  respond_to :xml

  def index
    @feed = Feed.new
    @feed.build_state params

    respond_with @feed
  end
end
