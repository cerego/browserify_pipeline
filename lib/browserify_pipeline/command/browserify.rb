module BrowserifyPipeline
  class Command
    class Browserify < Command
      def cli_string(file)
        "#{bin_path}/browserify #{file}"
      end
    end
  end
end