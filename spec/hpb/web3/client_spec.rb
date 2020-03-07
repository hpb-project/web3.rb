RSpec.describe HPB::Web3::Client do

  let(:client) { HPB::Web3::Client.new(host: 'node.myhpbwallet.com', port: '80') }
  let(:address) { '0xb0617bf785b4ce32a00bdffc7e093ad82c2e0925' }
  let(:block_hash) { '0x14e359841aa92a9befa315d866e3f9bbf4ea09662c30538064493f31ebc4ceee' }
  let(:tx_hash) { '0x7f19c141e526066d92331a4ecad637251e8f9d986faf3d79160b16c310c0a86a' }
  let(:block_number) { 3831251 }


  it 'should return gem version' do
    expect(HPB::Web3::VERSION).not_to be nil
    expect(HPB::Web3::VERSION).to eq '0.3.0'
  end

  it 'should return net version' do
    net_version = client.api.net_version
    expect(net_version).not_to be nil
  end

  it 'should return listening status' do
    listening_status = client.api.listening_status
    expect(listening_status).not_to be nil
  end

  it 'should return syncing status' do
    syncing_status = client.api.syncing_status
    expect(syncing_status).not_to be nil
  end

  it 'should return mining status' do
    mining_status = client.api.mining_status
    expect(mining_status).not_to be nil
  end

  it 'should return protocol version' do
    protocol_version = client.api.protocol_version
    expect(protocol_version).not_to be nil
  end

  it 'should return peer count' do
    peer_count = client.api.peer_count
    expect(peer_count).not_to be nil
  end

  it 'should return coinbase' do
    coinbase = client.api.coinbase
    expect(coinbase).not_to be nil
  end

  it 'should return max block number' do
    block_number = client.api.find_max_block_number
    expect(block_number).not_to be nil
  end

  it 'should return balance for address' do
    balance = client.api.find_balance_by_address(address)
    expect(balance).not_to be nil
    expect(balance).is_a? Float
    expect(balance).to be > 0
  end

  it 'should return accounts' do
    accounts = client.api.find_accounts
    expect(accounts).not_to be nil
    expect(accounts).is_a? Array
  end

  it 'should create account' do
    account = client.api.new_account('123456')
    expect(account).not_to be nil
    expect(account).is_a? String
  end

  it 'should return transaction count' do
    transaction_count = client.api.find_tx_count_by_address(address)
    expect(transaction_count).not_to be nil
  end

  it 'should return transaction count by block number' do
    transaction_count = client.api.find_tx_count_by_block_number(block_number)
    expect(transaction_count).not_to be nil
  end

  it 'should return transaction count by block hash' do
    transaction_count = client.api.find_tx_count_by_block_hash(block_hash)
    expect(transaction_count).not_to be nil
  end

  it 'should return uncle count by block number' do
    transaction_count = client.api.find_uncle_count_by_block_number(block_number)
    expect(transaction_count).not_to be nil
  end

  it 'should return uncle count by block hash' do
    transaction_count = client.api.find_uncle_count_by_block_hash(block_hash)
    expect(transaction_count).not_to be nil
  end

  it 'should return block by block number' do
    block = client.api.find_block_by_number(block_number)
    expect(block).not_to be nil
  end

  it 'should return block by block hash' do
    block = client.api.find_block_by_hash(block_hash)
    expect(block).not_to be nil
  end

  it 'should return transactions by block number' do
    transactions = client.api.find_tx_by_block_number(block_number, 0)
    expect(transactions).not_to be nil
  end

  it 'should return transactions by block hash' do
    transactions = client.api.find_tx_by_block_hash(block_hash, 0)
    expect(transactions).not_to be nil
  end

  it 'should return transaction receipt by transaction hash' do
    receipt = client.api.find_tx_receipt_by_tx_hash(tx_hash)
    expect(receipt).not_to be nil
  end

end
