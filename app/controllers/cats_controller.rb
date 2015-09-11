class CatsController < ApplicationController

  KEY = ENV["YOUTUBE_KEY"]
  YOUTUBE_URI = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&publishedAfter=2015-09-08T00%3A00%3A00Z&q=cat&type=video&videoEmbeddable=true&key=#{KEY}"

  # publishedAfter
  # q
  # type: video
  # videoEmbeddable: true
  def index
  end

  def show
    @results = HTTParty.get(YOUTUBE_URI)
  end
end
