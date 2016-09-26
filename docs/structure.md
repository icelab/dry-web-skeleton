# Application structure

This is a dry-web app, which means it consists of multiple [standalone components](http://dry-rb.org/gems/dry-component/) brought together and made accessible to HTTP users by your application.

This skeleton breaks your application down into:

1. A common "core" component, for managing database relations and exposing basic common functionality.
2. Multiple sub-app components, for the various discrete parts of your application.

The application starts with a vanilla `Roda` app ([source](/system/app_prototype/application.rb)) to explicitly mount each of your sub-apps onto their respective routes.

Each sub-app, located in `apps/<sub_app>`, is a `Dry::Web::Roda::Application`, which means it provides the following:

* A container of objects (configured in `apps/<sub_app>/component/<sub_app>/container.rb`)
* An auto-injection helper, for making composition of objects easy (see `apps/<sub_app>/component/<sub_app>/import.rb`)
* An application class for configuring HTTP behaviour and routing (in `apps/<sub_app>/component/<sub_app>/application.rb`), which provides access to the container for accessing the sub-app's logic and APIs
* A place to specify the sub-app’s full set of routes (split into separate files in `apps/<sub_app>/web/routes`)

Each sub-app imports the "core" component, which allows the sub-apps to share common logic and functionality. Right now, the core component is used for the following:

* Booting application-wide sub-systems and integrations with 3rd party services (in `system/boot/`)
* Setting up ROM for persistence and exposing the basic ROM commands and relations for the sub-apps to build upon with their own repositories ([learn more about the ROM setup here](rom.md))
