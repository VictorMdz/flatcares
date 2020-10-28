# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/invitations
  def invitations
    user = User.last
    UserMailer.with(user: user).invitations(user)
  end

end
