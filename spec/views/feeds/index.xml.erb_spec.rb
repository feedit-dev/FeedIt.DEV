require 'spec_helper'

RSpec.describe 'feeds/index.xml.erb', type: :view do

  context "renders a base XML feed" do
    let(:feed) { Feed.new(NullParams.new) }

    it 'renders with required XML channel attribute' do
      assign(:feed, feed)
      render
      expect(response.body).to include('<channel>')
    end

    it 'renders with required XML rss attribute' do
      assign(:feed, feed)
      render
      expect(response.body).to include('rss')
    end
  end

  context "renders an existing XML feed" do
    let(:feed) { 
      Feed.new({
        existing_feed: true
      }).generate! 
    }
    let(:existing_feed_were_using) { 
      'Throwing Shade' 
    }

    it "renders the existing_feed partial stored on disk" do
      assign(:feed, feed)
      render
      expect(response.body).to include(existing_feed_were_using)
    end
  end

  context "eps=2 URL param passed in" do
    let(:feed) {
      Feed.new({
        episodes: 2
      }).generate!
    }

    it "renders episodes in feed" do
      assign(:feed, feed)
      render
      expect(response.body).to include('<item>')
    end
  end
end
