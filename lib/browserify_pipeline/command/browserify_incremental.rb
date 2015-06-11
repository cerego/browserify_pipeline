module BrowserifyPipeline
  class Command
    class BrowserifyIncremental < Command
      def initialize(bin_path, tmp_path)
        super(bin_path)
        @tmp_path = tmp_path
      end

      def cli_string(file)
        "#{bin_path}/browserifyinc #{file} --cachefile=#{tmp_path}/#{file}.json"
      end

      private

      def tmp_path
        @tmp_path
      end
    end
  end
end