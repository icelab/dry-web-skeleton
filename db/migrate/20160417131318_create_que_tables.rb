ROM::SQL.migration do
  change do
    AppPrototype::Container.boot! :que
    Que.migrate!
  end
end
