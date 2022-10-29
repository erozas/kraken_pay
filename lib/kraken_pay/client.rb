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

    def handle_response(response)
      response
    end
  end
end
