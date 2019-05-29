class FeedsController < ApplicationController
  respond_to :xml

  def index
    @feed = Feed.new({
      existing_feed:  existing_feed,
      episodes:       episodes,
      empty_guid:     empty_guid,
      duplicate_guid: duplicate_guid,
      email:          email
    }).generate!

    respond_with @feed
  end

  def existing_feed
    params[:existing_feed] || params[:existing_feeds]
  end 
  def episodes
    (params[:eps] || NullEps.new.eps).chomp.to_i
  end

  def empty_guid
    params[:empty_guid] || params[:empty_guids]
  end

  def duplicate_guid
    params[:duplicate_guid] || params[:duplicate_guids]
  end

  def email
    params[:email]
  end
end
