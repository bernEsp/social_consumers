require 'consumer'
class InstagramConsumerJob < ApplicationJob
  include Consumer
  def consumer_client
    'instagram'
  end

  def store(json_response)
    InstagramPost.create!(
      json_response
    )
  end
end
