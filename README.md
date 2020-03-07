# Web3 RPC client for High Performance Blockchain Node

This Ruby Gem is used to connect and communicate with a High Performance Blockchain node using the RPC interface.

## Installation
```bash
# git clone https://github.com/hpb-project/web3.rb
# cd web3.rb
# bin/setup

To install this gem onto your local machine, run:
# bundle exec rake install

To run tests:
# rspec

You can also run the following command for an interactive prompt that will allow you to experiment:
# bin/console
```


### Connect

Connecting to local node ( or by SSH Tunnel )

```ruby
client = HPB::Web3::Client.new
```

If you need to connect to remote host, you can specify host, port and HTTP connection options:

```ruby
client = HPB::Web3::Client.new(
      host: 'node.myhpbwallet.com', 
      port: 80,  
      connect_options: { use_ssl: false, open_timeout: 20, read_timeout: 120 }
) 
```

HTTP connection options are from  [Ruby HTTP](https://ruby-doc.org/stdlib-2.4.2/libdoc/net/http/rdoc/Net/HTTP.html)  plus additional optional property
**rpc_path** - path to RPC interface.


### Calling HPB interface

```
>> client.api.find_max_block_number
4376369

>> client.api.find_balance_by_address '0xa1960fa87733f1b9ffbfb95d9d692471aa691c9c'
3916.6597314456685

>> block = client.api.find_block_by_block_number 12345
#<HPB::Web3::Block:0x.... @block_data={"author"=>"0x...", ...

>> block.timestamp_time
2017-10-17 12:51:36 +0300

>> block.transactions.count
129

>> block.transactions[0].from
"0xa1960fa87733f1b9ffbfb95d9d692471aa691c9c"

>> block.transactions[0].value_hpb
0.51896811

```


### Accesing contract methods

```
# creation of contract object
my_contract = client.api.contract(abi);

# initiate contract for an address
my_contract_instance = my_contract.at('0xa1960fa87733f1b9ffbfb95d9d692471aa691c9c');

# call constant function
result = my_contract_instance.balanceOf('0x...'); # any constant method works
puts result 
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

