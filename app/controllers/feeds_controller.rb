class FeedsController < ApplicationController
  respond_to :xml

  def index
    @feed = Feed.new({
      existing_feed: params[:existing_feed],
      episodes: params[:eps].chomp.to_i,
      empty_guid: params[:empty_guid],
    }).generate!
    respond_with @feed
  end
end
