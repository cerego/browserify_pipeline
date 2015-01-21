require 'tilt'

module BrowserifyPipeline
  class Template < ::Tilt::Template

    def prepare
    end

    def evaluate(scope, locals, &block)
      directory = scope.pathname.dirname.to_s
      file      = scope.pathname.basename.to_s

      stdout, stderr, status = open3("#{base_command} --list #{shell_options} #{file}", directory)
      unless status.success?
        raise "Error finding dependencies: #{stderr}"
      end

      set_cache_dependencies(scope, stdout.lines.drop(1))

      stdout, stderr, status =  open3("#{base_command} #{shell_options} #{file}", directory)
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

    def base_command
      config.browserify_path
    end

    def shell_options
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

      "#{source_map_option} #{transformer_option}".strip
    end

    def open3(command, directory)
      Open3.capture3({"NODE_PATH" => config.node_path}, command, chdir: directory)
    end

    def set_cache_dependencies(scope, dependencies)
      dependencies.each { |path| scope.depend_on(path.strip) }
    end

  end
end
