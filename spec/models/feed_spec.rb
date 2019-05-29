require 'rails_helper'

RSpec.describe Feed, type: :model do

  context "#.generate! with existing_feed" do
    feed = Feed.new({
      existing_feed: true
    }).generate!
    it "sets the existing_feed model state" do
      expect(feed.existing_feed).to eq(true)
    end
  end

  context "#.generate! with custom email" do
    feed = Feed.new(
      email: 'd@dain.io'
    ).generate!
    it "sets the custom email model state" do
      expect(feed.email).to eq('d@dain.io')
    end
  end

  context "#.generate! with episodes" do
    feed = Feed.new({
      episodes: 2
    }).generate!
    it "sets the episodes model state" do
      expect(feed.episodes.count).to eq(2)
    end
  end

  context "#.generate! with empty_guid" do
    feed = Feed.new({
      episodes: 2,
      empty_guid: true
    }).generate!
    it "sets the empty_guid model state" do
      expect(feed.episodes.first.empty_guid).to eq(true)
    end
  end

  context "#.generate! with duplicate_guid" do
    feed = Feed.new({
      episodes: 2,
      duplicate_guid: true
    }).generate!
    it "sets the duplicate_guid model state" do
      expect(feed.episodes.first.duplicate_guid).to eq(true)
    end
  end

  context "#.generate! with malformed_audio" do
    feed = Feed.new({
      episodes: 2,
      malformed_audio: true
    }).generate!
    it "sets the malformed_audio model state" do
      expect(feed.episodes.first.malformed_audio).to eq(true)
    end
  end
end
