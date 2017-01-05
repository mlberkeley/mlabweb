require 'test_helper'

class MemberMailerTest < ActionMailer::TestCase
  test "account_activation" do
    member = members(:david)
    member.activation_token = Member.new_token
    mail = MemberMailer.account_activation(member)
    assert_equal [member.email], mail.to
    assert_equal ["no-reply@ml.berkeley.edu"], mail.from
    assert_match member.name, mail.body.encoded
  end

end
