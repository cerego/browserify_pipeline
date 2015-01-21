$:.push File.expand_path("../lib", __FILE__)
require "browserify_pipeline/version"

Gem::Specification.new do |s|
  s.name        = "browserify_pipeline"
  s.version     = BrowserifyPipeline::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kevin Griffin"]
  s.email       = ["kgriffin@cerego.com"]
  s.homepage    = "http://iknow.jp"
  s.summary     = %q{Browserify preprocessor for the Rails asset pipeline.}
  s.description = %q{Browserify preprocessor for the Rails asset pipeline.}

  s.add_runtime_dependency "rails", "~> 3.2.0", '< 5.0'
  s.add_runtime_dependency "sprockets", "~> 2.0"
  s.add_runtime_dependency 'tilt'

  s.add_development_dependency 'rspec', '~> 3.1.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
