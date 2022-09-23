class DashboardController < ApplicationController
  include JsonResponders
  POST_LIMIT = 5_000

  def index
    @tweets = TwitterPost.all.limit(POST_LIMIT)
    @facebook_posts = FacebookPost.all.limit(POST_LIMIT)
    @instagram_posts = InstagramPost.all.limit(POST_LIMIT)
    render json: dashboard_response
  end

end
