# ROM

We use [ROM](http://rom-rb.org) for working with the app’s Postgres database. You can [learn more about why ROM is great](http://rom-rb.org/learn/) over at their documentation site.

## Setup

ROM is set up [in a boot file](component/boot/rom.rb) in core app component. In this file, we:

* Configure ROM's underlying [Sequel](https://github.com/jeremyevans/sequel) SQL adapter, informing it about timezones, and enabling some plugins to make working with Postgresql better (e.g. having it show full error messages, and enabling support for working with array and JSON columns).
* Configure ROM to use our app's `database_url`.
* Load all the files in `lib/persistence`.
* Then finalize ROM's environment, which makes all the classes from `lib/persistence` available in ROM's container.

## Relations

ROM relation classes should be placed in `lib/persistence/relations`. An example from one of our apps is `lib/persistence/relations/users.rb`:

```ruby
module Persistence
  module Relations
    class Users < ROM::Relation[:sql]
      schema(:users) do
        attribute :id, Types::Serial
        attribute :email, Types::String
        attribute :name, Types::String
      end

      def by_id(id)
        where(id: id)
      end

      def by_email(email)
        where(email: email)
      end
    end
  end
end
```

n.b. this relation is using the new `schema` feature from [rom-sql](https://github.com/rom-rb/rom-sql)’s `master` branch.

## Commands

Basic ROM command classes are not needed when working with [rom-repository](https://github.com/rom-rb/rom-sql)’s new [command support](https://github.com/rom-rb/rom-repository/pull/15) (currently available in its `master` branch only).

If you need to create more complex custom command classes, save them in `lib/persistence/commands`. An example from one of our apps is `lib/persistence/commands/collections/create_collection.rb`:

```ruby
require "functions"

module Persistence
  module Commands
    module Collections
      class UpdateCollection < ROM::Commands::Update[:sql]
        relation :collections
        register_as :update
        result :one

        def execute(tuple)
          # custom execute code here...
        end
      end
    end
  end
end
```

## Repositories

The skeleton provides a [basic application repository class](/lib/app_prototype/repository.rb), which makes the ROM container available to any repository subclasses you make inside the sub-apps.

Each sub-app should provide its own repositories, since these act as the primary interface to the persisted data, and each sub-app will have its own differing sets of needs.

An example repository from one of our apps is `apps/admin/lib/main/persistence/repositories/users.rb`:

```ruby
require "app_prototype/repository"
require "admin/entities/user"

module Admin
  module Persistence
    module Repositories
      class Users < AppPrototype::Repository[:users]
        commands :create, update: [:by_id, :by_email]

        alias_method :update, :update_by_id

        def [](id)
          users.by_id(id).as(Entities::User).one
        end

        def by_email(email)
          users.by_email(email).as(Entities::User).one
        end
      end
    end
  end
end
```

This example repository uses the new [built-in command support](https://github.com/rom-rb/rom-repository/pull/15) currently available only in rom-repository’s `master` branch. But it’s a wonderful feature, so we’re using it right away :)
