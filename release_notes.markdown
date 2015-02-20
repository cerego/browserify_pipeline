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

