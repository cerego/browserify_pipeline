BrowerifyPipeline
===

BrowerifyPipeline adds browserify preprocessing to the Rails asset pipeline. Just like with files ending in `.js.coffee` files,
files ending with `.js.browserify` will be preprocessed with this gem using `browserify`.

Acknowledgments
===
This gem is heavily inspired by [browserify-rails](https://github.com/browserify-rails/browserify-rails) and [Sprockets-Browserify](https://github.com/janv/sprockets-browserify), and uses code from each of them.

The key distinction of this gem is that it operates on files with special extensions (`.js.browserify`) to preprocess,
like the CoffeeScript support in the Rails asset pipeline. It's still quite simple and will benefit greatly from feedback and contributions.

Supported Environments
===
BrowerifyPipeline should work with Ruby 1.9.3 and higher. It should also work with both Rails 3.2 and Rails 4.

Usage
===

**Add the gem to your Gemfile**

```ruby
gem 'browserify_pipeline'
```

**Set up your package.json**

`myapp/package.json`

```json
{
  "name": "myapp",
  "version": "1.0.0",
  "repository": {
    "type": "git",
    "url": "https://github.com/me/myapp.git"
  },
  "devDependencies": {
    "browserify": "7.0.1",
  }
}

```

**Install your node modules**
```
npm install
```

**Create an example file for testing**

```
echo "require('example');" > example.js.browserify
```

**Start a server and visit the asset**

```
rails s -p 3000
curl "http://localhost:3000/assets/example.js"
```

Configuration
===

BrowerifyPipeline supports four types of configuration, set in your environment files or `application.rb`, using `config.browserify_pipeline`

transformers
---

BrowerifyPipeline allows you to use a collection of transformers with browserify. A transformer has a name and commandline options passed to it.

Transformers should be subclasses of `BrowerifyPipeline::Transformer::Base`

**Creating a transformer**

```ruby
class Coffeeify < BrowerifyPipeline::Transformer::Base
  def initialize(commandline_options)
    # Superclass takes the name of the transformer and a command line options string
    super('coffeeify', commandline_options)
  end
end
```

**Adding the transformers**

`config/application.rb`
```ruby
module MyApp
  class Application < Rails::Application
    config.browserify_pipeline.transformers << Coffeeify.new
  end
end
```



generate_source_map
---

Passes the `-d` option to `browserify`. Set this in your `config/development.rb` file.

```ruby
module MyApp
  class Application < Rails::Application
    config.browserify_pipeline.generate_source_map = true
  end
end
```

browserify_path
---

Allows you to specifiy the path to the `browserify` executable. Defaults to `"#{Rails.root}/node_modules/.bin/browserify"`

```ruby
module MyApp
  class Application < Rails::Application
    config.browserify_pipeline.default_browserify_path = '/data/node_modules/.bin/browserify'
  end
end
```

node_path
---

Allows you to specifiy the `NODE_PATH` environment variable used when running the `browserify` executable. Defaults to the Rails asset paths.

```ruby
module MyApp
  class Application < Rails::Application
    config.browserify_pipeline.node_path = 'node_path'
  end
end
```

Contributing
===
If you'd like to contribute, here are some key areas that will be a great help:

* Testing on multiple versions of Rails
* Testing with different node and browserify environments
* Adding additional transformers to the standard collection

To contribute, please fork this repository and submit a pull request. Be sure to include spec files along with your request.
If you haven't used RSpec, check out its [site](http://rspec.info).