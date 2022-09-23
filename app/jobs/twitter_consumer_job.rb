require 'consumer'
class TwitterConsumerJob < ApplicationJob
  include Consumer

  def consumer_client
    'twitter'
  end

  def store(json_response)
    TwitterPost.create!(
      json_response
    )
  end
end
