class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" mail@test-guru-ng.herokuapp.com}
  layout 'mailer'
end
