class JsonController < ApplicationController
  respond_to :json

  def index
    @v = {test: 'test'}
    render json: @v
  end

end
