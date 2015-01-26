require 'browserify_pipeline/transformer/base'

module BrowserifyPipeline
  module Transformer
    class SixToFiveify < Base

      def initialize(command_line_options = '--extensions .browserify --extensions .js')
        super('6to5ify', command_line_options)
      end

    end
  end
end
