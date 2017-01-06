class SubscriberMailer < ApplicationMailer

  default from: 'general@ml.berkeley.edu',
          reply_to: 'support@ml.berkeley.edu'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.subscribe.subject
  #
  def subscribe(subscriber)
    @subscriber = subscriber
    mail to: subscriber.email, subject: "Subscription Confirmation: Welcome, #{subscriber.name}!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.unsubscribe.subject
  #
  def unsubscribe(subscriber)
    @subscriber = subscriber
    mail to: subscriber.email, subject: "Unsubscribe"
  end
end
