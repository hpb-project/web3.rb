require File.expand_path("../../test_helper", __FILE__)

class Web3::HpbTest < Minitest::Test
  def setup
    @web3 = Web3::Hpb::Rpc.new host: 'node.myhpbwallet.com',
                              port: 443,
                              connect_options: { open_timeout: 20, read_timeout: 120, use_ssl: true }
  end

  def test_web3rb_version_number
     refute_nil ::Web3::Hpb::VERSION
  end

  def test_version
    test = @web3.hpb.version
    refute_nil test
    assert test.is_a? String
    assert test == '100'
  end

  def test_blockNumber
    test = @web3.hpb.blockNumber
    refute_nil test
    assert test.is_a? Integer
    assert test => 5000
  end

  def test_getBalance
    test = @web3.hpb.getBalance("0xb0617bf785b4ce32a00bdffc7e093ad82c2e0925")
    refute_nil test
    assert test.is_a? Float
    assert test >= 0
  end

  def test_listening
    test = @web3.hpb.listening
    refute_nil test
    assert test == true
  end

  def test_peerCount
    test = @web3.hpb.peerCount
    refute_nil test
    assert test.is_a? String
    assert test != "0x0"
  end

  def test_protocolVersion
    test = @web3.hpb.protocolVersion
    refute_nil test
    assert test.is_a? String
    assert test != "0x0"
  end

  def test_syncing
    test = @web3.hpb.syncing
    refute_nil test
  end

  def test_coinbase
    test = @web3.hpb.coinbase
    refute_nil test
    assert test.is_a? String
  end

  def test_mining
    test = @web3.hpb.mining
    refute_nil test
  end

  def test_acconuts
    test = @web3.hpb.accounts
    refute_nil test
    assert test.kind_of?(Array)
  end

  def test_newAccount
    test = @web3.hpb.newAccount('12345678')
    refute_nil test
    assert test.is_a? String
  end

  def test_getTransactionCount
    test = @web3.hpb.getTransactionCount(["0x407d73d8a49eeb85d32cf465507dd71d507100c1", "latest"])
    refute_nil test
    assert test.is_a? String
  end

  def test_getBlockTransactionCountByNumber
    test = @web3.hpb.getBlockTransactionCountByNumber(["0x3A75D3"])
    refute_nil test
    assert test.is_a? String
  end

  def test_getBlockTransactionCountByHash
    test = @web3.hpb.getBlockTransactionCountByHash(["0x14e359841aa92a9befa315d866e3f9bbf4ea09662c30538064493f31ebc4ceee"])
    refute_nil test
    assert test.is_a? String
  end

  def test_getUncleCountByBlockHash
    test = @web3.hpb.getUncleCountByBlockHash(["0x14e359841aa92a9befa315d866e3f9bbf4ea09662c30538064493f31ebc4ceee"])
    refute_nil test
    assert test.is_a? String
  end

  def test_getUncleCountByBlockNumber
    test = @web3.hpb.getUncleCountByBlockNumber(["0x3A75D3"])
    refute_nil test
    assert test.is_a? String
  end

  def test_getBlockByNumber
    test = @web3.hpb.getBlockByNumber(["0x1b4", true])
    refute_nil test
  end

  def test_getBlockByHash
    test = @web3.hpb.getBlockByHash(["0x14e359841aa92a9befa315d866e3f9bbf4ea09662c30538064493f31ebc4ceee", true])
    refute_nil test
  end

  def test_getTransactionByBlockHashAndIndex
    test = @web3.hpb.getTransactionByBlockHashAndIndex(["0x14e359841aa92a9befa315d866e3f9bbf4ea09662c30538064493f31ebc4ceee", "0x0"])
    refute_nil test
  end

  def test_getTransactionByBlockNumberAndIndex
    test = @web3.hpb.getTransactionByBlockNumberAndIndex(["0x3A75D3", "0x0"])
    refute_nil test
  end

  def test_getTransactionReceipt
    test = @web3.hpb.getTransactionReceipt(["0x7f19c141e526066d92331a4ecad637251e8f9d986faf3d79160b16c310c0a86a"])
    refute_nil test
  end

#  def test_sendTransaction
#    test = @web3.hpb.sendTransaction([{"from": "0x....", "to": "0x...", "gas": "0x12", "gasPrice": "0x2540BE400", "value": "0x46C7CFE00"}])
#    refute_nil test
#    assert test.is_a? String
#  end
end
