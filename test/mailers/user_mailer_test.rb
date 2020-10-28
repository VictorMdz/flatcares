require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "invitations" do
    mail = UserMailer.invitations
    assert_equal "Invitations", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
