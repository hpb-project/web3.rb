module HPB
  module Web3
    class API

      include HPB::Web3::Utility

      def initialize(client)
        @client = client
      end

      def net_version
        from_hex @client.request('net_version')
      end

      def listening_status
        @client.request('net_listening')
      end

      def syncing_status
        @client.request('hpb_syncing')
      end

      def mining_status
        @client.request('hpb_mining')
      end

      def protocol_version
        from_hex @client.request('hpb_protocolVersion')
      end

      def peer_count
        from_hex @client.request('net_peerCount')
      end

      def coinbase
        @client.request('hpb_coinbase')
      end

      def find_max_block_number
        from_hex @client.request('hpb_blockNumber')
      end

      def find_balance_by_address(address)
        from_hex @client.request('hpb_getBalance', address, 'latest')
      end

      def find_accounts
        @client.request('hpb_accounts')
      end

      def new_account(password)
        @client.request('personal_newAccount', password)
      end

      def find_block_by_number(block_number)
        @client.request('hpb_getBlockByNumber', hex(block_number), true)
      end

      def find_block_by_hash(block_hash)
        @client.request('hpb_getBlockByHash', block_hash, true)
      end

      def find_tx_count_by_address(address)
        @client.request('hpb_getTransactionCount', address, 'latest')
      end

      def find_tx_count_by_block_number(block_number)
        @client.request('hpb_getBlockTransactionCountByNumber', hex(block_number))
      end

      def find_tx_count_by_block_hash(block_hash)
        @client.request('hpb_getBlockTransactionCountByHash', block_hash)
      end

      def find_tx_by_block_number(block_number, index)
        @client.request('hpb_getTransactionByBlockNumberAndIndex', hex(block_number), hex(index))
      end

      def find_tx_by_block_hash(block_hash, index)
        @client.request('hpb_getTransactionByBlockHashAndIndex', block_hash, hex(index))
      end

      def find_uncle_count_by_block_hash(block_hash)
        @client.request('hpb_getUncleCountByBlockHash', block_hash)
      end

      def find_uncle_count_by_block_number(block_number)
        @client.request('hpb_getUncleCountByBlockNumber', hex(block_number))
      end

      def find_tx_receipt_by_tx_hash(tx_hash)
        @client.request('hpb_getTransactionReceipt', tx_hash)
      end

      def send_transaction(from, to, gas, gas_price, value)
        @client.request('hpb_sendTransaction', { from: from, to: to, gas: gas, gas_price: gas_price, value: value })
      end

    end
  end
end
