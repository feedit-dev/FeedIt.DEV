require 'spec_helper'

RSpec.describe JsonController, type: :controller do

  describe "GET episodes" do
    it "renders format application/json" do
      get :episodes, { params: { id: 2 }, format: :json }
      expect(response.content_type).to eq('application/json')
    end

    it "gets episodes for a show" do
      get :episodes, { params: { id: 2 }, format: :json }
      expect(response.body).to_not be_nil
    end

    it "returns 200 success when the episode exists" do
      get :episodes, { params: { id: 2 }, format: :json }
      expect(response.status).to eq(200)
    end

    it "gets no episodes if the ID doesn't exist" do
      get :episodes, { params: { id: 99999 }, format: :json }
      expect(response.body).to eq("null")
    end

    it "returns 404 when the episode doesn't exist" do
      get :episodes, { params: { id: 99999 }, format: :json }
      expect(response.status).to eq(404)
    end
  end

end
