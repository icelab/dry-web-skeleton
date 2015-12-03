source "https://rubygems.org"

ruby "2.2.3"

# Web framework
gem "puma"
gem "rodakase", git: "https://github.com/timriley/rodakase", branch: "null-view-parts"
gem "shotgun"

# Database persistence
gem "pg"
gem "rom", git: "https://github.com/rom-rb/rom"
gem "rom-mapper", git: "https://github.com/rom-rb/rom-mapper"
gem "rom-repository", git: "https://github.com/rom-rb/rom-repository"
gem "rom-sql", git: "https://github.com/rom-rb/rom-sql"
gem "rom-support", git: "https://github.com/rom-rb/rom-support"

# Application dependencies
gem "call_sheet", git: "https://github.com/icelab/call_sheet"
gem "dry-data", git: "https://github.com/dryrb/dry-data"
gem "dry-validation", git: "https://github.com/dryrb/dry-validation"
gem "either_result_matcher"
gem "slim"
gem "transproc", git: "https://github.com/solnic/transproc"

group :development, :test do
  gem "guard-rspec", require: false
  gem "pry-byebug"
end

group :test do
  gem "capybara", require: false
  gem "capybara-screenshot", require: false
  gem "database_cleaner"
  gem "inflecto"
  gem "rspec"
  gem "site_prism"
end
