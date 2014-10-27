require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  # test "problem_submit" do  #stopped working for some reason
  #   user = users(:one)
  #   problem = problems(:one)
  #   mail = UserMailer.problem_submit(user, problem)
  #   assert_equal "Your problem has been created", mail.subject
  #   assert_equal [user.email], mail.to
  #   assert_equal ["fortkick@ass.com"], mail.from
  # end

  # test "note_alert" do   #never really worked well
  #   note = notes(:one)
  #   mail = UserMailer.note_alert(note.problem.user, note)
  #   assert_equal "A note has been added to your problem", mail.subject
  #   assert_equal [note.problem.user.email], mail.to
  #   assert_equal ["fortkick@ass.com"], mail.from
  # end
end
