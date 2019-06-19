class JsonController < GeneratorController
  respond_to :json

  def index
    super
    respond_with @feed
  end

  def shows
    @shows = [
      {
        id: 1,
        name: 'Joe Rogan',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/en/thumb/4/4b/The_Joe_Rogan_Experience_logo.jpg/220px-The_Joe_Rogan_Experience_logo.jpg'
      }
    ]
    render json: @shows
  end

end
