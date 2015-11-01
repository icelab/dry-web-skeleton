source "https://rubygems.org"

ruby "2.2.3"

# Web framework
gem "puma"
gem "roda"
gem "roda-flow"
gem "shotgun"

# Database persistence
# Tracking master due to unreleased fixes for issues with rom-repository: https://github.com/rom-rb/rom-repository/issues/2
gem "pg"
gem "rom", git: "git@github.com:rom-rb/rom.git"
gem "rom-mapper", git: "git@github.com:rom-rb/rom-mapper.git"
gem "rom-repository", git: "git@github.com:rom-rb/rom-repository.git"
gem "rom-sql", git: "git@github.com:rom-rb/rom-sql.git"
gem "rom-support", git: "git@github.com:rom-rb/rom-support.git"

# Application dependencies
gem "activesupport", require: false # inflection & some core extensions
gem "bcrypt"
gem "call_sheet", git: "git@github.com:icelab/call_sheet"
gem "dotenv"
gem "dry-data", require: "dry/data"
gem "slim"
gem "transproc", git: "git@github.com:solnic/transproc.git"

group :development, :test do
  gem "guard-rspec", require: false
  gem "pry-byebug"
  gem "sqlite3"
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "database_cleaner"
  gem "rspec"
  gem "site_prism"
end
