module SimpleSpark
  module Endpoints
    # Provides access to the /tracking-domains endpoint
    # @note Example tracking domain
    #
    # {
    #   "domain": "example.domain.com",
    #   "port": 443,
    #   "secure": true,
    #   "default": false,
    #   "status": {
    #     "verified": false,
    #     "cname_status": "pending",
    #     "compliance_status": "pending"
    #   }
    # }
    #
    # @note See: https://developers.sparkpost.com/api/tracking-domains/#header-tracking-domain-object
    class TrackingDomains
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      # Lists your tracking domains
      # @return [Array] a list of Tracking Domain hash objects
      # @note See: https://developers.sparkpost.com/api/tracking-domains/#tracking-domains-get-list-all-tracking-domains
      def list
        @client.call(method: :get, path: 'tracking-domains')
      end

      # Create a tracking domain
      # @param domain [String] Name of the tracking domain to create
      # @param secure [Boolean] Whether the tracking URL should use HTTPS. Default is false
      # @note See: https://developers.sparkpost.com/api/tracking-domains/#tracking-domains-post-create-a-tracking-domain
      def create(values)
        @client.call(method: :post, path: 'tracking-domains', body_values: values)
      end

      # Retrieve a tracking domain
      # @param domain_name [String] the domain name to retrieve
      # @return [Hash] an Tracking Domain hash object
      # @note See: https://developers.sparkpost.com/api/#/reference/tracking-domains/retrieve-update-and-delete
      def retrieve(domain_name)
        domain_name = @client.url_encode(domain_name)
        @client.call(method: :get, path: "tracking-domains/#{domain_name}")
      end

      # Update a Tracking Domain by its domain name
      # @param domain_name [String] the domain to update
      # @param values [Hash] the values to update the tracking domain with. Available values are:
      #   - secure [Boolean] Whether the tracking URL should use HTTPS
      #   - default [Boolean] Whether the tracking domain should be used when not explicitly associated with a sending domain
      #
      # @note See: https://developers.sparkpost.com/api/#/reference/tracking-domains/retrieve-update-and-delete
      def update(domain_name, values)
        domain_name = @client.url_encode(domain_name)
        @client.call(method: :put, path: "tracking-domains/#{domain_name}", body_values: values)
      end

      # Verify a Tracking Domain by its domain name
      # @param domain_name [String] the domain to verify
      #
      # @note See: https://developers.sparkpost.com/api/tracking-domains/#tracking-domains-post-verify-a-tracking-domain
      def verify(domain_name)
        domain_name = @client.url_encode(domain_name)
        @client.call(method: :post, path: "tracking-domains/#{domain_name}/verify", body_values: {})
      end

      # Delete a Tracking Domain
      # @param domain_name [String] the domain name to delete
      # @note See: https://developers.sparkpost.com/api/tracking-domains/#tracking-domains-delete-delete-a-tracking-domain
      def delete(domain_name)
        domain_name = @client.url_encode(domain_name)
        @client.call(method: :delete, path: "tracking-domains/#{domain_name}")
      end
    end
  end
end
