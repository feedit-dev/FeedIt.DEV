class FeedsController < ApplicationController
  respond_to :xml

  def index
    @feed = Feed.new.build_state_from_url params
    respond_with @feed
  end
end
