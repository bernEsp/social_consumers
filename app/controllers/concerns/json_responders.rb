module JsonResponders
  extend ActiveSupport::Concern
  private

  def dashboard_response
    {
      twitter: @tweets,
      facebook: @facebook_posts,
      instagram: @instagram_posts
    }
  end
end
