require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase

  def setup
    @subscriber = Subscriber.new(name: "Example Subscriber", email: "subscriber@example.com")
  end

  test "should be valid" do
    assert @subscriber.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[sub@example.com SUB@foo.COM A_SUB-ER@foo.bar.org
                         first.last@foo.jp sub+sub@baz.cn]
    valid_addresses.each do |valid_address|
      @subscriber.email = valid_address
      assert @subscriber.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_subscriber = @subscriber.dup
    duplicate_subscriber.email = @subscriber.email.upcase
    @subscriber.save
    assert_not duplicate_subscriber.valid?
  end
end
