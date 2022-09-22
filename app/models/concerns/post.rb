module Post
  extend ActiveSupport::Concern

  included do
    validates :username, presence: true
  end
end
