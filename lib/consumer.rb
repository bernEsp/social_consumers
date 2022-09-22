require "active_support/concern"
require 'net/http'


module Consumer
  extend ActiveSupport::Concern

  class Timeout < StandardError
    def message
      'Consumer Timeout'
    end
  end

  class Invalid < StandardError
    def message
      'Consumer invalid response'
    end
  end

  included do
    retry_on Net::OpenTimeout, Consumer::Timeout, attempts: 3
  end

  def perform
    store(response(consume))
  rescue Consumer::Invalid,
    ActiveModel::UnknownAttributeError,
    ActiveModel::StrictValidationFailed
    false
  end

  def consume
    Net::HTTP.get_response(URI("#{api}#{consumer_client}"))
  end

  def api
    'https://takehome.io/'
  end

  def response(net_response)
    case net_response
    when Net::HTTPSuccess, Net::HTTPOK then
      begin
        parsed_response = JSON.parse(net_response.body, {symbolize_names: true} )
        case parsed_response
        when Array then
          parsed_response
        else
          raise Consumer::Invalid
        end
      rescue JSON::ParserError
        raise Consumer::Invalid
      end
    else
      raise Consumer::Timeout
    end
  end
end
