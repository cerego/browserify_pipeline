require 'browserify_pipeline/template.rb'
require 'browserify_pipeline/configuration.rb'

module BrowserifyPipeline
  class Engine < ::Rails::Engine
    config.browserify_pipeline = ::BrowserifyPipeline::Configuration.new

    initializer :setup_browserify_piepline, after: 'sprockets.environment', group: :all do |app|
      Rails.application.config.assets.configure do |env|
        #env.register_engine '.browserify', BrowserifyPipeline::Template

	env.register_mime_type 'text/browserify', extensions: ['.browserify']
	env.register_preprocessor 'text/browserify', BrowserifyPipeline::Template
      end
    end
  end
end
