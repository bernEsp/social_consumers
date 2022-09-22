require "test_helper"

class FacebookPostTest < ActiveSupport::TestCase
  test "should not save facebook posts without username" do
    instagram_post = FacebookPost.new
    assert_not instagram_post.save, "Saved the Facebook Post without username"
  end

  test "should not save facebook posts without status" do
    instagram_post = FacebookPost.new(username: 'testuser')
    assert_not instagram_post.save, "Saved the Facebook Post without status"
  end
end
