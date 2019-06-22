class JsonController < GeneratorController
  respond_to :json

  def index
    super
    respond_with @feed
  end

  def episodes
    show = _shows.select { |show| show.fetch(:id).to_s == params[:id].to_s }
    show = show.first
    show['episodes'] = [
      {
        id: 1,
        title: 'some episode title',
        audio_url: 'here'
      },
      {
        id: 2,
        title: 'some other episode title',
        audio_url: 'here 2'
      }
    ]
    binding.pry
    render json: show
  end

  # List of temporary podcasts (will be updated to use data from DB)
  def shows
    render json: _shows
  end

  def _shows
    [
      {
        id: 1,
        title: 'Joe Rogan',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/en/thumb/4/4b/The_Joe_Rogan_Experience_logo.jpg/220px-The_Joe_Rogan_Experience_logo.jpg'
      },
      {
        id: 2,
        title: 'Accidental Tech Podcast',
        imageUrl: 'https://pbs.twimg.com/profile_images/418453319385120769/yrjxadhc.jpeg'
      },
      {
        id: 3,
        title: "Start Here: Ruby on Rails",
        imageUrl: 'http://i1.sndcdn.com/avatars-000227601719-zmd5i2-original.jpg'
      },
      {
        id: 4,
        title: "Ungeniused",
        imageUrl: "https://relayfm.s3.amazonaws.com/uploads/broadcast/image_2x/28/ungeniused_artwork.png"
      },
      {
        id: 5,
        title: 'Mac Power Users',
        imageUrl: 'https://relayfm.s3.amazonaws.com/uploads/broadcast/image_2x/16/mpu_artwork.png'
      },
      {
        id: 6,
        title: 'Material',
        imageUrl: 'https://relayfm.s3.amazonaws.com/uploads/broadcast/image_2x/19/material_artwork.png'
      },
      {
        id: 7,
        title: 'Download',
        imageUrl: 'https://relayfm.s3.amazonaws.com/uploads/broadcast/image_2x/38/download_artwork.png'
      },
      {
        id: 8,
        title: 'X-Files',
        imageUrl: ''
      }
    ]
  end

end
