class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@ml.berkeley.edu',
          reply_to: 'support@ml.berkeley.edu'
  layout 'mailer'
end
