class GeneratorController < ApplicationController

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
      explicit:       explicit,
      category:       category,
      type:           type
    }).generate!

    SavedQuery.save_by(params)
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
    params[:explicit] or NullBoolean.new.explicit
  end

  def category
    params[:category] or NullCategory.new.category
  end

  def type
    params[:type] or NullType.new.type
  end
end
