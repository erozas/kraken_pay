# frozen_string_literal: true

require_relative 'kraken_pay/version'

module KrakenPay
  autoload :ApiError, 'kraken_pay/api_error'
  autoload :Client, 'kraken_pay/client'
  autoload :Configuration, 'kraken_pay/configuration'
  autoload :HttpStatusCodes, 'kraken_pay/http_status_codes'
  autoload :Resource, 'kraken_pay/resource'

  autoload :Transaction, 'kraken_pay/resources/transaction'

  autoload :BadRequestError, 'kraken_pay/api_error'
  autoload :NotFoundError, 'kraken_pay/api_error'
  autoload :InternalServerError, 'kraken_pay/api_error'
  autoload :UnauthorizedError, 'kraken_pay/api_error'
  autoload :ForbiddenError, 'kraken_pay/api_error'
  autoload :TooManyRequestsError, 'kraken_pay/api_error'
  autoload :UnprocessableEntityError, 'kraken_pay/api_error'

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
