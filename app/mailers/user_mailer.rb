class UserMailer < ActionMailer::Base
  default from: "fortkick@ass.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.problem_submit.subject
  #
  def problem_submit(user, problem)
    @user = user
    @problem = problem
    mail to: @user.email, subject: "Your problem has been created"
  end

  def note_alert(user, problem)
    @user = user
    @note = problem
    mail to: @user.email, subject: "A note has been added to your problem"
  end
end
