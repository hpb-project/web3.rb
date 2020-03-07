require 'json'
require 'logger'
require 'net/http'

module HPB
  module Web3
    class Client

      DEFAULT_HOST     = 'localhost'
      DEFAULT_PORT     = '8545'
      JSON_RPC_VERSION = '2.0'
      DEFAULT_OPTIONS  = { use_ssl: false, open_timeout: 10, read_timeout: 70 }

      attr_reader :api, :trace

      def initialize(host: DEFAULT_HOST, port: DEFAULT_PORT, options: DEFAULT_OPTIONS)
        @options   = options
        @logger    = Logger.new($stdout)
        @client_id = Random.rand 10000000
        @api       = API.new self
        @trace     = TraceModule.new self
        @uri       = URI("#{options[:use_ssl] ? 'https' : 'http'}://#{host}:#{port}#{options[:uri]}")
      end

      def request(method, *args)
        Net::HTTP.start(@uri.host, @uri.port, @options) do |http|
          request      = Net::HTTP::Post.new @uri, { "Content-Type" => "application/json" }
          request.body = { jsonrpc: '2.0', method: method, params: args, id: @client_id }.compact.to_json
          response     = http.request(request)
          if response.kind_of? Net::HTTPOK
            handler_response(response)
          else
            raise "Error code #{response.code} on request #{@uri.to_s} #{request.body}"
          end
        end
      end

      private

      def handler_response(response)
        response_body = JSON.parse(response.body, { symbolize_names: true })
        @logger.info "[HPB Response] => #{response_body}"
        if response_body[:result] || response_body[:result] == false
          response_body[:result]
        elsif response_body[:error]
          raise "Error #{@uri.to_s} #{response_body[:error]} on request #{@uri.to_s}"
        else
          raise "No response on request #{@uri.to_s}"
        end
      end

    end
  end
end