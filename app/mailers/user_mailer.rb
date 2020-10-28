class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invitations.subject
  #
  def invitations(user)
    @user = user # Instance variable => available in view
    mail(to: @user.email, subject: 'Invitation to join Flatcares')
    # This will render a view in `app/views/user_mailer`!
  end
end
