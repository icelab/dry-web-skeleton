# Icelab’s dry-web skeleton

This is an opinionated starter skeleton for [dry-web][dry-web] projects at [Icelab](http://icelab.com.au/), but you might find it useful too!

It uses:

* [dry-web][dry-web] for the core application container and dependency management
* [Roda][roda] for HTTP handling and routing
* [ROM][rom] for database persistence
* [dry-view][dry-view] for data-oriented view rendering
* [dry-validation][dry-validation] for data validation (e.g. HTML forms)
* [dry-types][dry-types] for shared application type coercions and constraints
* [dry-transaction][dry-transaction] for modelling complex business transactions
* [i18n][i18n] for i18n-ing of things
* [Que][que] for background job processing

It also integrates with these 3rd party services:

* [Bugsnag][bugsnag] for error reporting
* [Postmark][bugsnag] for email deliveries

[bugsnag]: https://bugsnag.com
[dry-transaction]:  http://dry-rb.org/gems/dry-transaction
[dry-types]:  http://dry-rb.org/gems/dry-types
[dry-validation]: http://dry-rb.org/gems/dry-validation
[dry-view]: https://github.com/dry-rb/dry-view
[dry-web]: https://github.com/dry-rb/dry-web
[i18n]: https://github.com/svenfuchs/i18n
[postmark]: https://postmarkapp.com
[que]: https://github.com/chanks/que
[roda]: http://roda.jeremyevans.net/
[rom]: http://rom-rb.org/

## Documentation

* [Application structure](structure.md)
* [ROM setup](rom.md)
* Rake tasks
* View rendering
* Background jobs
* Business transactions
* [Assets](assets.md)
