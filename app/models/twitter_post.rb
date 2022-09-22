class TwitterPost < ApplicationRecord
  include Post
  validates :tweet, presence: true
end
