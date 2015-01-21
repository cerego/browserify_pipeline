require 'tilt'

module BrowserifyPipeline
  class Template < ::Tilt::Template

    def prepare
    end

    def evaluate(scope, locals, &block)
      directory = scope.pathname.dirname.to_s
      stdout, stderr, status = Open3.capture3({"NODE_PATH" => config.node_path}, "#{shell_command} #{scope.pathname.basename}", chdir: directory)

      if status.success?
        stdout
      else
        raise RuntimeError.new("browserify failed with #{stderr}")
      end
    end

    private

    def config
      Rails.application.config.browserify_pipeline
    end

    def shell_command
      if transformer = config.transformer
        transformer_option = "-t [ #{transformer.name} #{transformer.command_line_options} ]"
      else
        transformer_option =  ''
      end

      if config.generate_source_map
        source_map_option = '-d'
      else
        source_map_option = ''
      end

      "#{config.browserify_path} #{source_map_option} #{transformer_option}".strip
    end

  end
end
