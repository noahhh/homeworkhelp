require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "problem_submit" do
    mail = UserMailer.problem_submit
    assert_equal "Problem submit", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
