json.feed do
  json.(@feed,
        :title,
        :email,
        :description,
        :author,
        :explicit,
        :category,
        :type
       )
  if @feed.episodes
    @feed.episodes.each do |episode|
      json.episode do
        :title
      end
    end
  end
end
