lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'hpb/web3/version'

Gem::Specification.new do |spec|
  spec.name          = 'hpb-web3'
  spec.version       = HPB::Web3::VERSION
  spec.authors       = ['vincent']
  spec.email         = ['vincent4502237@gmail.com']

  spec.summary       = 'Web3 client to connect to HPB node by RPC.'
  spec.description   = 'Calling RPC methods of HPB node with Ruby.'
  spec.homepage      = 'https://github.com/hpb-project/web3.rb'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/hpb-project/web3.rb'
  spec.metadata['changelog_uri'] = 'https://github.com/hpb-project/web3.rb'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
