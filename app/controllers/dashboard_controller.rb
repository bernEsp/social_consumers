class DashboardController < ApplicationController
  include JsonResponders

  def index
    @tweets = TwitterPost.all
    @facebook_posts = FacebookPost.all
    @instagram_posts = InstagramPost.all
    render json: dashboard_response
  end

end
