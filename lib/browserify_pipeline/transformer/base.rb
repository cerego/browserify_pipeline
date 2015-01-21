module BrowserifyPipeline
  module Transformer
    class Base
      attr_reader :name, :command_line_options

      def initialize(name, command_line_options = '')
        @name                 = name
        @command_line_options = command_line_options
      end

    end
  end
end
