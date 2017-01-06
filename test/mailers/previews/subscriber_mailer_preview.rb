# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/subscriber_mailer/subscribe
  def subscribe
    subscriber = Subscriber.first
    SubscriberMailer.subscribe(subscriber)
  end

  # Preview this email at http://localhost:3000/rails/mailers/subscriber_mailer/unsubscribe
  def unsubscribe
    SubscriberMailer.unsubscribe
  end

end
