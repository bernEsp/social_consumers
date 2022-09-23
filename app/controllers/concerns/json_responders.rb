module JsonResponders
  extend ActiveSupport::Concern
  private

  def dashboard_response
    data = {
      twitter: @tweets.map(&:tweet),
      facebook: @facebook_posts.map(&:status),
      instagram: @instagram_posts.map(&:picture)
    }
    JSON.pretty_generate(data, pretty_format)
  end

  protected

    def pretty_format
      {
        indent: '  ',   # Two spaces
        space: ' ',     # One space
        array_nl: "\n", # Newline
        object_nl: "\n" # Newline
      }
    end
end
