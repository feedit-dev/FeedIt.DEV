class JsonController < GeneratorController
  respond_to :json

  def index
    super

    respond_with @feed
  end

end
