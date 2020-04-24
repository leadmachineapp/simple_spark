module SimpleSpark
  module Endpoints
    # Provides access to the /recipient-validation endpoint
    # @note Example validation
    # {
    #   "valid": false,
    #   "result": "undeliverable",
    #   "reason": "Invalid Domain",
    #   "is_role": false,
    #   "is_disposable": false,
    #   "is_free": false
    # }
    # @note See: https://developers.sparkpost.com/api/recipient-validation/
    class RecipientValidation
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      # Validate a recipient email address.
      # @param address [String] the email address to validate
      # @return [Hash] a Recipient Validation hash object
      # @note See: https://developers.sparkpost.com/api/recipient-validation/#recipient-validation-get-email-address-validation
      def validate(address)
        address = @client.url_encode(address)
        @client.call(method: :get, path: "recipient-validation/single/#{address}")
      end
    end
  end
end
