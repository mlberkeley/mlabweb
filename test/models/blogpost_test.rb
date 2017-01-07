require 'test_helper'

class BlogpostTest < ActiveSupport::TestCase

  def setup
    @member = members(:david)
    @blogpost = @member.blogposts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @blogpost.valid?
  end

  test "published should be false initially" do
    assert !@blogpost.published
  end

  test "order should be most recent first" do
    assert_equal blogposts(:most_recent), Blogpost.first
  end
end
