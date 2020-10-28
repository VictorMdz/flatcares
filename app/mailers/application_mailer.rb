class ApplicationMailer < ActionMailer::Base
  default from: 'invitations@flatcares.com'
  layout 'mailer'
end
