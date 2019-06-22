require 'spec_helper'

RSpec.describe JsonController, type: :controller do

  describe "GET episodes" do
    it "gets episodes for a show" do
      get :episodes, { params: { id: 2 }, format: :json }
    end
  end

  describe "GET index" do

    it "renders the base xml template" do
      get :index, format: :json
      expect(response.content_type).to eq('application/json')
      expect(response).to render_template(:index)
    end

    it "assigns the Feed with params to the @feed object correctly" do
      feed_mock = Feed.new({
        existing_feed: nil,
        episodes: 2,
        empty_guid: nil,
        duplicate_guid: nil
      }).generate!
      get :index, { params: { eps: "2"}, format: :json }
      expect(assigns(:feed).episodes.count).to eq(feed_mock.episodes.count)
    end
  end
end

