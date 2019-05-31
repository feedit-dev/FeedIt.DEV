require 'spec_helper'

RSpec.describe 'feeds/index.xml.erb', type: :view do

  context "base XML feed" do
    let(:feed) { Feed.new(NullParams.new) }

    it 'renders required XML channel attribute' do
      assign(:feed, feed)
      render
      expect(response.body).to include('<channel>')
    end

    it 'renders required XML rss attribute' do
      assign(:feed, feed)
      render
      expect(response.body).to include('rss')
    end
  end

  context "pre-existing iTunes feed" do
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

  context "custom feed attributes" do
    let(:custom_email) { 'd@dain.io' }
    let(:custom_title) { 'Title' }
    let(:custom_description) { 'Description' }
    let(:feed) {
      Feed.new(
        email: custom_email,
        title: custom_title,
        description: custom_description
      ).generate!
    }

    it "renders a custom email address" do
      assign(:feed, feed)
      render
      expect(response.body).to include(custom_email)
    end

    it "renders a custom title" do
      assign(:feed, feed)
      render
      expect(response.body).to include(custom_title)
    end

    it "renders a custom description" do
      assign(:feed, feed)
      render
      expect(response.body).to include(custom_description)
    end
  end

  context "custom episode quantity" do
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
