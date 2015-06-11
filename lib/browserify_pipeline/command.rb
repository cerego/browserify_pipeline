require 'browserify_pipeline/command/browserify'
require 'browserify_pipeline/command/browserify_incremental'

module BrowserifyPipeline
  class Command
    def initialize(bin_path)
      unless File.executable?(bin_path)
        raise ArgumentError.new("Path is not executable: #{bin_path}")
      end

      @bin_path = bin_path
    end

    # provide the minimal command line string for
    # a given file (keep configuration for all files in Configuration class)
    def cli_string(file)
      raise StandardError.new('unimplemented')
    end

    private

    def bin_path
      @bin_path
    end
  end
end