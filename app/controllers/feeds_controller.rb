class FeedsController < ApplicationController
  respond_to :xml

  def index
    # Boot up feed object
    @feed = Feed.new

    # Episodes requires #.to_i conversion
    # So we can't dynamically call on Feed obj.
    if params[:eps]
      @feed.with_episodes(count: params[:eps].to_i)
    end
    params.delete(:eps)

    # Build up feed state dynamically
    for feed_option in params
      @feed.send(feed_option[0]) if @feed.respond_to? feed_option[0]
    end

    respond_with @test
  end
end
