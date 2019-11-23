class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" mail@cofhap.com}
  layout 'mailer'
end
