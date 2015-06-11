0.0.7
---

Summary
===

Support multiple binaries to allow using wrappers around browserify.
Provide support for [browserify-incremental](https://github.com/jsdf/browserify-incremental) to speed up development reloads.

Details
===

Two configuration settings have had their defaults removed, and must be set externally: `node_path`,  and the new `browserify_command`
This is done to remove dependance on Rails, making things more testable and robust.

`node_path` must be set after boot, in `after_initialize`:

```ruby
config.after_initialize do |app|
  app.config.browserify_pipeline.node_path = Rails.application.config.assets.paths.map(&:to_s).join(":")
end
```

`browserify_command` is a class that provides a `cli_string` that serves as the basis for the command:

`application.rb`
```ruby
  config.browserify_pipeline.browserify_command = BrowserifyPipeline::Command::Browserify.new("#{Rails.root}/node_modules/.bin")
```

Install `browserify-incremental` with `npm` to use incremental compilation in development. You need to provide a path for the compiler to store cached JSON:

`development.rb`
```ruby
  config.browserify_pipeline.browserify_command = BrowserifyPipeline::Command::BrowserifyIncremental.new("#{Rails.root}/node_modules/.bin", "#{Rails.root}/tmp")
```

0.0.6
---

Summary
===

Bugfix for `Babel` transformer

Details
===

`Babel` runs `babelify`, not `babel`

0.0.5
---

Summary
===

Change 6to5 to Babel: [blog post](https://babeljs.io/blog/2015/02/15/not-born-to-die/)

Details
===

* `SixToFiveify` transformer now called `Babel` and runs `babel`, not `6to5`

0.0.4
---

Summary
===

Bug fix release

Details
===

* `SixToFiveify` transformer now correctly applies to JS files as well.

0.0.3
---

Summary
===

Stackable transformers -- transformers are applied in the order they are added to the gem configuration.

Details
===

* `Configuration#transformer` is now `Configuration#transformers`
* `Configuration#add_transformer` added to support multiple transformers.
* All transformers are rendered into the commandline.

0.0.2
---

Summary
===

Support cache-buster dependencies. This means changing a file required by a browserified file will cause
Rails to regenerate the files that depend on it.

Details
===

* Call `depend_on` for each dependency listed by `browserify`

0.0.1
---

Summary
===

Initial release!

Details
===

* Transformer support
* Source map support
* Asset pipeline integration

