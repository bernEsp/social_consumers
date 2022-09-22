class FacebookPost < ApplicationRecord
  include Post
  validates :status, presence: true
end
