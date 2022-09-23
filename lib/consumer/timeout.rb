module Consumer
  class Timeout < StandardError
    def message
      'Consumer Timeout'
    end
  end
end
