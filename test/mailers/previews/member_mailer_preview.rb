# Preview all emails at http://localhost:3000/rails/mailers/member_mailer
class MemberMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/member_mailer/account_activation
  def account_activation
    member = Member.second
    member.activation_token = Member.new_token
    MemberMailer.account_activation(member)
  end

  # Preview this email at http://localhost:3000/rails/mailers/member_mailer/password_reset
  def password_reset
    member = Member.second
    member.reset_token = Member.new_token
    MemberMailer.password_reset(member)
  end

end
