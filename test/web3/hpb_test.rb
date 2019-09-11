require File.expand_path("../../test_helper", __FILE__)

class Web3::HpbTest < Minitest::Test
  def test_that_it_has_a_version_number
     refute_nil ::Web3::Hpb::VERSION
  end

  def test_that_it_has_hpb_version
    web3 = Web3::Hpb::Rpc.new host: 'node.myhpbwallet.com',
                              port: 443,
                              connect_options: { open_timeout: 20, read_timeout: 120, use_ssl: true }
    htp_version = web3.hpb.version
    assert htp_version != nil
    assert htp_version.is_a?(String)
    assert htp_version == '100'
  end
end
