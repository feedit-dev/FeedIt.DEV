class FeedsController < ApplicationController
  respond_to :xml

  def index
    eps = params[:eps] || NullEps.new.eps

    @feed = Feed.new({
      existing_feed:  params[:existing_feed] || params[:existing_feeds],
      episodes:       eps.chomp.to_i,
      empty_guid:     params[:empty_guid] || params[:empty_guids],
      duplicate_guid: params[:duplicate_guid] || params[:duplicate_guids]
    }).generate!

    respond_with @feed
  end
end