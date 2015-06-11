module BrowserifyPipeline
  # Configuration settings:
  # transformers, node_path, browserify_command, generate_source_map
  class Configuration
    # These must be set explcitly
    attr_accessor :node_path
    attr_reader   :browserify_command

    # These are optional
    attr_accessor :generate_source_map
    attr_reader   :transformers

    def initialize
      @transformers = []
    end

    def add_transformer(transformer_instance)
      unless transformer_instance.is_a?(BrowserifyPipeline::Transformer::Base)
        raise ArgumentError.new('Transformer must be a subclass of BrowserifyPipeline::Transformer::Base')
      end

      @transformers << transformer_instance
    end

    def browserify_command=(command)
      unless command.is_a?(BrowserifyPipeline::Command)
        raise ArgumentError.new("Command must be a subclass of BrowserifyPipeline::Command")
      end

      @browserify_command = command
    end

  end
end
