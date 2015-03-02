require 'browserify_pipeline/transformer/base'

module BrowserifyPipeline
  module Transformer
    class Babel < Base

      def initialize(command_line_options = '--extensions .browserify --extensions .js')
        super('babelify', command_line_options)
      end

    end
  end
end
