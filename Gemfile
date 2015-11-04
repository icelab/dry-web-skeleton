source "https://rubygems.org"

ruby "2.2.3"

# Web framework
gem "puma"
gem "rodakase", git: "git@github.com:solnic/rodakase.git"
gem "shotgun"

# Database persistence
gem "pg"
gem "rom", git: "git@github.com:rom-rb/rom.git"
gem "rom-mapper", git: "git@github.com:rom-rb/rom-mapper.git"
gem "rom-repository", git: "git@github.com:rom-rb/rom-repository.git"
gem "rom-sql", git: "git@github.com:rom-rb/rom-sql.git"
gem "rom-support", git: "git@github.com:rom-rb/rom-support.git"

# Application dependencies
gem "activesupport" # inflection & some core extensions
gem "call_sheet", "~> 0.2.0"
gem "dotenv"
gem "dry-data"
gem "memoit"
gem "rom-model", git: "git@github.com:rom-rb/rom-model.git"
gem "slim"
gem "transproc", git: "git@github.com:solnic/transproc.git"

group :development, :test do
  gem "guard-rspec", require: false
  gem "pry-byebug"
end

group :development do
  gem "foreman"
end

group :test do
  gem "capybara", require: false
  gem "capybara-screenshot", require: false
  gem "database_cleaner"
  gem "rspec"
  gem "site_prism"
end
