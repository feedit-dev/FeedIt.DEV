class JsonController < GeneratorController
  respond_to :json

  def index
    super
    respond_with @feed
  end

  def shows
    shows = [{name: 'Joe Rogan', imageUrl: 'URL HERE'}]
    render json: shows
  end

end
