require 'consumer'
class FacebookConsumerJob < ApplicationJob
  include Consumer

  def consumer_client
    'facebook'
  end

  def store(json_response)
    FacebookPost.create!(
      json_response
    )
  end
end
