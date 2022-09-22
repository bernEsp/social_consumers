require "test_helper"

class TwitterPostTest < ActiveSupport::TestCase
  test "should not save tweet post without username" do
    tweet_post = TwitterPost.new
    assert_not tweet_post.save, "Saved the Tweet Post without username"
  end

  test "should not save tweet post without tweet" do
    tweet_post = TwitterPost.new(username: 'testuser')
    assert_not tweet_post.save, "Saved the Tweet Post without tweet"
  end
end
