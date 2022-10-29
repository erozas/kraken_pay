module KrakenPay
  class ApiError < StandardError
    attr_accessor :response, :code
    attr_reader :http_body, :http_headers, :message

    def initialize(message = nil, http_body = nil, _http_headers = nil)
      @message = message
      @http_body = http_body
      @http_headers = http_headers
    end

    # It should be raised when the API call returns a 400 Error Code
    class BadRequestError < ApiError
    end

    # It should be raised when the API call returns a 401 Error Code
    class UnauthorizedError < ApiError
    end

    # It should be raised when the API call returns a 403 Error Code
    class ForbiddenError < ApiError
    end

    # It should be raised when the API call returns a 404 Error Code
    class NotFoundError < ApiError
    end

    # It should be raised when the API call returns a 422 Error Code
    class UnprocessableEntityError < ApiError
    end

    # It should be raised when the API call returns a 429 Error Code
    class TooManyRequestsError < ApiError
    end

    # It should be raised when the API call returns 500 error
    class InternalServerError < ApiError
    end
  end
end
