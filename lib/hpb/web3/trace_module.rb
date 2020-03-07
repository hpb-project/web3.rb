module HPB
  module Web3
    class TraceModule

      include HPB::Web3::Utility

      def initialize(web3_rpc)
        @client = web3_rpc
      end

      def method_missing(method, *args)
        @client.request "trace_#{method}", args[0]
      end

      def internal_calls_by_hash(tx_hash)
        @client.request("trace_transaction", [tx_hash])
               .select { |t| t['traceAddress'] != [] }
               .collect { |t| CallTrace.new t }
      end

    end
  end
end
