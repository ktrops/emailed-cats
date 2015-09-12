class CatVideoMailer < ApplicationMailer
  def message
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'katrops@gmail.com',
      :from => 'welovecats@cat-videos.herokuapp.com',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end
end
