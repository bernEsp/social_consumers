class FacebookPost < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true
end
