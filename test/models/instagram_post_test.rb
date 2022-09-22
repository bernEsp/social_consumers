require "test_helper"

class InstagramPostTest < ActiveSupport::TestCase
  test "should not save instagram post without username" do
    instagram_post = InstagramPost.new
    assert_not instagram_post.save, "Saved the Instagram Post without username"
  end

  test "should not save instagram post without picutre" do
    instagram_post = InstagramPost.new(username: 'testuser')
    assert_not instagram_post.save, "Saved the Instagram Post without picture"
  end
end
