lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "solo/version"

Gem::Specification.new do |spec|
  spec.name          = "solo-rb"
  spec.version       = Solo::VERSION
  spec.authors       = ["Travis Rasor"]
  spec.email         = ["travis@thathanka.org"]

  spec.summary       = %q{Prevents programs from running more than one copy at a time}
  spec.description   = %q{A port of Solo, a perl script, into a gem that prevents a program from running more than one copy at a time}
  spec.homepage      = "https://github.com/tlrasor/solo-rb"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tlrasor/solo-rb"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files         = Dir.glob("{bin,lib}/**/*")
  
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_runtime_dependency "rationalist", "~> 2.0"
end
