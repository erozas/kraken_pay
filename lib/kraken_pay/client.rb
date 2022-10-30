# frozen_string_literal: true

require 'httparty'
require 'json'

module KrakenPay
  class Client
    attr_reader :affiliate_code

    BASE_URL = KrakenPay.configuration.api_endpoint

    def initialize
      @affiliate_code = KrakenPay.configuration.affiliate_code
    end

    def generate_qr_payment(params)
      response = HTTParty.post("#{BASE_URL}/process/bisa-qr", body: params.to_json, headers: default_headers)
    end

    def register_transaction(params)
      response = HTTParty.post("#{BASE_URL}/transaction", body: params.to_json, headers: default_headers)
      handle_response(response)
    end

    def check_qr_payment_status(payment_id, transaction_id)
      response = HTTParty.get("#{BASE_URL}/status/bisa-qr/#{payment_id}/#{transaction_id}", headers: default_headers)
    end

    private

    def default_headers
      { 'Content-Type' => 'application/json', 'Accept' => '*/*', 'Accept-Encoding' => 'gzip, deflate, br' }
    end

    # Because of the way the API works: it doesn't return a status code for successfull requests
    # We need to handle errors conditionally. If the response doesn't have a status code, it means
    # That it was successfull. If it does, it means there was an error
    def handle_response(response)
      parsed = JSON.parse(response.body)
      return parsed unless parsed['status']

      case parsed['status']
      when 400
        raise ApiError::BadRequestError, parsed['detail']
      when 401
        raise ApiError::UnauthorizedError, parsed['detail']
      when 403
        raise ApiError::ForbiddenError, parsed['detail']
      when 404
        raise ApiError::NotFoundError, parsed['detail']
      when 422
        raise ApiError::UnprocessableEntityError, parsed['detail']
      when 429
        raise ApiError::TooManyRequestsError, parsed['detail']
      when 500
        raise ApiError::InternalServerError, parsed['detail']
      end
    end
  end
end
