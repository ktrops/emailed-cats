class CatsController < ApplicationController


  two_days = Time.now - (60 * 60 * 48)
  year = two_days.year
  day = two_days.day
  month = two_days.month

  PUBLISHEDAFTER = "#{year}-#{month}-#{day}T00%3A00%3A00Z"
  KEY = ENV["YOUTUBE_KEY"]
  YOUTUBE_URI = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=5&order=rating&publishedAfter=#{PUBLISHEDAFTER}&q=cat+-makeup+-minecraft+-mario+-truck+-fight+-full+-birth+-microphone+-cartoon+-animation+-MARIO_GATO+-Chocolate+-hobie+-roblox+-Prototype&relevanceLanguage=en&type=video&videoEmbeddable=true&key=#{KEY}"

  # publishedAfter
  # q
  # type: video
  # videoEmbeddable: true

  def index
  end

  def show
    response = HTTParty.get(YOUTUBE_URI)
    @data = format_data(response)
  end

  def format_data(response)
    videos = response.fetch "items", {}
    videos.map do |video|
      id = video.fetch("id", "")
      snippet = video.fetch("snippet", "")
      {
        id: id.fetch("videoId", ""),
        published: snippet.fetch("publishedAt", ""),
        title: snippet.fetch("title", ""),
        description: snippet.fetch("description", "")
      }
    end

  end

end
