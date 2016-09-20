source "https://rubygems.org"

ruby "2.3.1"

gem "rake"

# Web framework
gem "puma"
gem "dry-web", "~> 0.5"
gem "dry-web-roda", "~> 0.4"
gem "rack_csrf"
gem "shotgun"

# Database persistence
gem "pg"
gem "rom"
gem "rom-mapper"
gem "rom-repository"
gem "rom-sql"
gem "rom-support"

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
gem "transproc", git: "https://github.com/solnic/transproc"

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
