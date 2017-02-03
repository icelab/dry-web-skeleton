source "https://rubygems.org"

ruby "2.4.0"

gem "rake"

# Web framework
gem "puma"
gem "dry-web", "~> 0.5"
gem "dry-web-roda", "~> 0.4"
gem "rack_csrf"
gem "shotgun"

# Database persistence
gem "pg"
gem "rom", "~> 3.0.0"
gem "rom-mapper", "~> 0.5.0"
gem "rom-repository", "~> 1.0.0"
gem "rom-sql", "~> 1.0.0"

# Background jobs
gem "que"

# Application dependencies
gem "dry-equalizer"
gem "dry-logic"
gem "dry-result_matcher"
gem "dry-transaction"
gem "dry-types"
gem "dry-validation"
gem "dry-view"
gem "i18n"
gem "slim"
gem "transproc"

# 3rd party services
gem "bugsnag"
gem "postmark"

group :development, :test do
  gem "guard-rspec", require: false
  gem "pry-byebug"
end

group :test do
  gem "capybara", require: false
  gem "capybara-screenshot", require: false
  gem "database_cleaner"
  gem "inflecto"
  gem "poltergeist"
  gem "rspec"
  gem "site_prism"
end
