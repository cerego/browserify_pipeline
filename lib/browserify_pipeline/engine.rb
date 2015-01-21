require 'browserify_pipeline/template.rb'
require 'browserify_pipeline/configuration.rb'

module BrowserifyPipeline
  class Engine < ::Rails::Engine
    config.browserify_pipeline = ::BrowserifyPipeline::Configuration.new

    initializer :setup_browserify_piepline, after: 'sprockets.environment', group: :all do |app|
      Rails.application.assets.register_engine '.browserify', BrowserifyPipeline::Template
    end
  end
end
