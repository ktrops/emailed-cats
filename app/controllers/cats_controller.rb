class CatsController < ApplicationController

  SEARCH_TERM = 'cat'
  YOUTUBE_URI = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&publishedAfter=2015-09-08T00%3A00%3A00Z&q=cat&type=video&videoEmbeddable=true&key={YOUR_API_KEY}"

  # publishedAfter
  # q
  # type: video
  # videoEmbeddable: true
  def index
  end

  def show
  end
end
