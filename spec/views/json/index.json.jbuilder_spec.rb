require 'spec_helper'

RSpec.describe 'json/index.json.jbuilder', type: :view do

  context "base JSON feed" do
    let(:feed) {
      Feed.new({title: "Test"}).generate!
    }

    it 'renders required JSON attributes' do
      assign(:feed, feed)
      render
      expect(response.body).to include('title')
      expect(response.body).to include('Test')
      expect(response.body).to include('category')
    end

  end
  context "custom feed attributes" do
    let(:custom_email) { 'd@dain.io' }
    let(:custom_title) { 'Title' }
    let(:custom_description) { 'Description' }
    let(:custom_author) { 'Dain' }
    let(:custom_category) { 'health' }
    let(:custom_type) { 'Episodic' }
    let(:custom_explicit) { 'no' }
    let(:feed) {
      Feed.new(
        email: custom_email,
        title: custom_title,
        description: custom_description,
        category: custom_category,
        type: custom_type,
        explicit: custom_explicit,
        author: custom_author
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

    it "renders a custom author" do
      assign(:feed, feed)
      render
      expect(response.body).to include(custom_author)
    end

    it "renders a custom category" do
      assign(:feed, feed)
      render
      expect(response.body).to include(custom_category)
    end

    it "renders a custom explicit" do
      assign(:feed, feed)
      render
      expect(response.body).to include(custom_explicit)
    end

    it "renders a custom type" do
      assign(:feed, feed)
      render
      expect(response.body).to include(custom_type)
    end

  end

end
