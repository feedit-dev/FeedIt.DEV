class FeedsController < GeneratorController
  respond_to :xml

  def index
    super

    respond_with @feed
  end

end
