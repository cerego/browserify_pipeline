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

