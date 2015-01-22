module BrowserifyPipeline
  # Configuration settings:
  # transformer, node_path, browserify_path, generate_source_map
  class Configuration
    attr_reader :transformers
    attr_writer :node_path
    attr_accessor :generate_source_map

    def initialize
      @transformers = []
    end

    def add_transformer(transformer_instance)
      unless transformer_instance.is_a?(BrowserifyPipeline::Transformer::Base)
        raise ArgumentError.new('Please pass a subclass of BrowserifyPipeline::Transformer::Base')
      end

      @transformers << transformer_instance
    end

    # Since Rails.root won't be set until after this configuration is
    # created, the default must be lazy as it refers to the root.
    def browserify_path
      if @browserify_path
        @browserify_path
      else
        default_browserify_path
      end
    end

    def browserify_path=(path)
      unless File.executable?(path)
        raise ArgumentError.new("Path is not executable: #{path}")
      end

      @browserify_path = path
    end

    # Since Rails.application won't be set until after this configuration is
    # created, the default must be lazy as it refers to paths set in the application.
    def node_path
      if @node_path
        @node_path
      else
        default_node_path
      end
    end

    private

    def default_node_path
      Rails.application.config.assets.paths.collect { |p| p.to_s }.join(":") || ""
    end

    def default_browserify_path
      "#{Rails.root}/node_modules/.bin/browserify"
    end
  end
end
