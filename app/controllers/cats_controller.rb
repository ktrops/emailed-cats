

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
    @email = Person.new
  end

  def create
    if Person.create(email_params)
      client = Postmark::ApiClient.new(ENV["POSTMARK_KEY"])
      client.deliver(from: 'welovecats@cat-videos.herokuapp.com',
               to: 'katrops@gmail.com',
               subject: 'Re: Come on, Sheldon. It will be fun.',
               text_body: 'That\'s what you said about the Green Lantern ' \
                          'movie. You were 114 minutes of wrong.')
      redirect_to :email_sent
    end
  end

  def email_sent
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

  def email_params
    params.require(:person).permit(:email)
  end

end
