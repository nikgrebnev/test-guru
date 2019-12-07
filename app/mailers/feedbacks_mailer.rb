class FeedbacksMailer < ApplicationMailer

  def submit_feedback(user, body)
    @user = user
    @body = body
    admin_email = User.find_by( type: "Admin").email

    mail to: admin_email, subject: 'New feedback'
  end
end
