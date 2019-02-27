class FeedsController < ApplicationController
  respond_to :xml

  def index
    @feed = Feed.new

    # Episodes requires #.to_i conversion
    # So we can't dynamically call on Feed obj.
    if params[:eps]
      @feed.with_episodes(count: params[:eps].to_i)
    end

    # Kill the eps in params to not break dynamic calling
    params.delete(:eps)

    # Build up feed state dynamically
    for feed_option in params
      @feed.send(feed_option[0]) if @feed.respond_to? feed_option[0]
    end

    respond_with @feed
  end
end
