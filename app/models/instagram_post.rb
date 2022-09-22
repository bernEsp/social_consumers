class InstagramPost < ApplicationRecord
  include Post
  validates :picture, presence: true
end
