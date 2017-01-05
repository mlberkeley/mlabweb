class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@ml.berkeley.edu'
  layout 'mailer'
end
