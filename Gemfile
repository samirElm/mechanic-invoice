source "https://rubygems.org"

ruby "2.2.0"

gem "rails", "4.2.0"
gem "pg"
gem "figaro"
gem "simple_form"
gem "country_select"
gem "high_voltage"
gem "devise"
gem "pundit"
gem "paperclip"
gem "aws-sdk", "< 2.0"
gem 'activeadmin', github: 'activeadmin'

gem "jquery-rails"
gem "sass-rails", "~> 5.0"
gem "uglifier"
gem "bootstrap-sass"
gem "font-awesome-sass"

gem "rails-i18n"
gem "devise-i18n"
gem "devise-i18n-views"

gem 'money-rails'
gem "cocoon"
gem "bourbon"

gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'wkhtmltopdf-heroku', '~> 2.12.2.1'

# parse a xlsx file (to delete after db seed)
gem 'roo', '~> 2.0.0'

group :development, :test do
  gem "spring"
  gem "annotate"
  gem "binding_of_caller"
  gem "better_errors"
  gem "quiet_assets"
  gem "pry-byebug"
  gem "pry-rails"
  gem "letter_opener"
  gem "rspec-rails"
  gem "factory_girl_rails", "~> 4.0"
end

group :production do
  gem "rails_12factor"
  gem "puma"
  gem "rack-timeout"
end
