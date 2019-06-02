class FeedsController < ApplicationController
  respond_to :xml

  def index
    @feed = Feed.new({
      existing_feed:  existing_feed,
      episodes:       episodes,
      empty_guid:     empty_guid,
      duplicate_guid: duplicate_guid,
      email:          email,
      title:          title,
      description:    description,
      author:         author,
      explicit:       explicit
    }).generate!

    SavedQuery.save_by(params)

    respond_with @feed
  end

  def existing_feed
    params[:existing_feed] or params[:existing_feeds]
  end

  def episodes
    (params[:eps] or NullEps.new.eps).chomp.to_i
  end

  def empty_guid
    params[:empty_guid] or params[:empty_guids]
  end

  def duplicate_guid
    params[:duplicate_guid] or params[:duplicate_guids]
  end

  def email
    params[:email] or NullEmail.new.email
  end

  def title
    params[:title] or NullTitle.new.title
  end

  def description
    params[:description] or NullDescription.new.description
  end

  def author
    params[:author] or NullAuthor.new.author
  end

  def explicit
    iiiparams[:explicit] or NullBoolean.new.explicit
  end
eniiid
