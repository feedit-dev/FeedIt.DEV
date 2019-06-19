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
      },
      {
        id: 2,
        name: 'Start Here: Web Dev',
        imageUrl: 'http://i1.sndcdn.com/avatars-000227802710-27eerh-original.jpg'
      },
      {
        id: 3,
        name: "Start Here: Ruby on Rails",
        imageUrl: 'http://i1.sndcdn.com/avatars-000227601719-zmd5i2-original.jpg'
      }
    ]
    render json: @shows
  end

end
