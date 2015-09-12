class CatVideoMailer < ApplicationMailer
  def message
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'katrops@gmail.com',
      :from => 'cats@welovecatvideos.com',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end
end
