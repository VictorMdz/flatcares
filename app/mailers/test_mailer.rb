class TestMailer < ApplicationMailer
  default from: 'contact@flatcares.com'

  def hello
    mail(
      subject: 'Hello from Postmark',
      to: 'contact@flatcares.com',
      from: 'contact@flatcares.com',
      html_body: '<strong>Hello</strong> dear Postmark user.',
      track_opens: 'true',
      message_stream: 'outbound')
  end
end
