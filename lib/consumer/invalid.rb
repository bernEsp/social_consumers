module Consumer
  class Invalid < StandardError
    def message
      'Consumer invalid response'
    end
  end
end
