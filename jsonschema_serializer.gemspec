
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jsonschema_serializer/version'

Gem::Specification.new do |spec|
  spec.name          = 'jsonschema_serializer'
  spec.version       = JsonschemaSerializer::VERSION
  spec.authors       = ['Mauro Berlanda']
  spec.email         = ['mauro.berlanda@gmail.com']

  spec.summary       = 'Generate JsonSchema in Rails or standalone Ruby'
  spec.description   = <<-DESCRIPTION
    This gem allows to generate JsonSchema thanks to a Builder class or
    an ActiveRecord serialization class. It can be used in Rails 4, 5 or
    Ruby standalone projects. The output validation is done agains json-schema.
  DESCRIPTION
  spec.homepage      = 'https://github.com/mberlanda/jsonschema_serializer'
  spec.licenses      = ['MIT']

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata = { 'source_code_uri' => 'https://github.com/mberlanda/jsonschema_serializer' }
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #    "public gem pushes."
  # end

  spec.files = Dir.glob('lib/**/*') + %w[jsonschema_serializer.gemspec README.md]
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.extra_rdoc_files = ['README.md']
  spec.rdoc_options << '--title' << 'Jsonschema Serializer' \
    '--main' << 'README.md' \
    '--line-numbers'

  spec.required_ruby_version = '>= 2.1.0'
end
