class Episode
  attr_accessor :empty_guid, :duplicate_guid, :malformed_audio
  def self.for_show show
    show['episodes'] = [
      {
        id: "#{show.try(:id)}1",
        title: "Title",
        description: 'some description',
        season_id: 3,
        number: 10,
        is_published: true,
        media: [{
          id: "#{show.try(:id)}111",
          url: 'http://feeds.soundcloud.com/stream/598981890-starthere-webdev-entry-level-jobs.mp3',
          duration: 300
        }]
      },
      {
        id: "#{show.try(:id)}2",
        title: "Title 2",
        description: 'some description',
        season_id: 3,
        number: 11,
        is_published: true,
        media: [{
          id: "#{show.try(:id)}2222",
          url: 'http://feeds.soundcloud.com/stream/598981890-starthere-webdev-entry-level-jobs.mp3',
          duration: 300
        }]
      }
    ]
    show
  end
end
