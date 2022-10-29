module KrakenPay
  class Configuration
    # The endpoint that this gem will use to interact with the API
    # defaults to: nil
    # @return [String]
    attr_accessor :api_endpoint

    # The code that identifies the merchant with Kraken
    # defaults to: nil
    # @return [String]
    attr_accessor :affiliate_code

    # The username used to identify our account with Kraken
    # defaults to: nil
    # @return [String]
    attr_accessor :username

    # The password used to corroborate our identity with Kraken
    # defaults to: nil
    # @return [String]

    def initialize
      @api_endpoint = nil
      @affiliate_code = nil
      @username = nil
      @password = nil
    end
  end
end
