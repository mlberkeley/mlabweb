class MemberMailer < ApplicationMailer

  default from: 'no-reply@ml.berkeley.edu',
          reply_to: 'support@ml.berkeley.edu'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.account_activation.subject
  #
  def account_activation(member)
    @member = member
    mail to: member.email, subject: "Mailer Test in Production: Activation: #{@member.name}'s ML@B Account"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
