class ApplicationMailer < ActionMailer::Base
  default from: ENV["SMTP_USER_FROM"]
#  default from: %{"TestGuru" mail@test-guru-ng.herokuapp.com}
  layout 'mailer'
end
