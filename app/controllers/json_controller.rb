class JsonController < GeneratorController

  respond_to :json

  def index
    super
    respond_with @feed
  end

  def episodes
    show = Show.cache.select { |show| show.fetch(:id).to_s == params[:id].to_s }.first
    unless show.nil?
      show = Show.with_episodes show
      render json: show
    else
      render json: nil, status: 404
    end
  end

  # List of temporary podcasts (will be updated to use data from DB)
  def shows
    render json: Show.cache
  end

end
