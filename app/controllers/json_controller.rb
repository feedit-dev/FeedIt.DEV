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
        imageUrl: 'https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/fd78be85-b845-4672-a316-7df0abe80812_medium'
      },
      {
        id: 2,
        name: 'Start Here: Web Dev',
        imageUrl: 'https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/fd78be85-b845-4672-a316-7df0abe80812_medium'
      },
      {
        id: 3,
        name: "Start Here: Ruby on Rails",
        imageUrl: 'https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/fd78be85-b845-4672-a316-7df0abe80812_medium'
      }
    ]
    render json: @shows
  end

end
