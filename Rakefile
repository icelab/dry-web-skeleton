require "./app_prototype"
require "rom/sql/rake_task"
require "rspec/core/rake_task"
require "sequel"

# Add `rake spec` task and make it default
RSpec::Core::RakeTask.new(:spec)
task :default => :spec

namespace :db do
  task :setup do
    ROM.setup(:sql, ENV["DATABASE_URL"])
  end

  # The following migration tasks are adapted from https://gist.github.com/kalmbach/4471560
  Sequel.extension :migration
  DB = Sequel.connect(ENV["DATABASE_URL"])

  desc "Prints current schema version"
  task :version do
    version = if DB.tables.include?(:schema_migrations)
      DB[:schema_migrations].order(:filename).last[:filename]
    end || "not available"

    puts "Current schema version: #{version}"
  end

  desc "Perform migration up to latest migration available"
  task :migrate do
    # The migrate task is provided by rom, but we can print the current version after it runs
    Rake::Task["db:version"].execute
  end

  desc "Perform rollback to specified target"
  task :rollback, :target do |t, args|
    Sequel::Migrator.run(DB, "db/migrate", :target => args[:target].to_i)
    Rake::Task["db:version"].execute
  end

  desc "Load seed data into the database"
  task :seed do
    seed_data = File.join("db", "seed.rb")
    load(seed_data) if File.exist?(seed_data)
  end

  desc "Load a small, representative set of data so that the application can start in a useful state (for development)."
  task :sample_data do
    sample_data = File.join("db", "sample_data.rb")
    load(sample_data) if File.exist?(sample_data)
  end
end
