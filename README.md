# Installation
1. Copy db/config.yml.example and rename it config.yml
1. Ruby
    1. For Windows : ruby 2.6.5.1
    1. `gem install bundle`
    1. `bundle install`
1. db
    1. `rake db:create`
    1. `rake db:migrate`

# Rake
    rake --tasks

    rake db:new_migration name=create_client
    
# Observer
Add this line to your application's Gemfile:

    gem 'rails-observers'

And then execute: 

    $ bundle

Add 

    require 'rails/observers/activerecord/active_record' 
    
to the observer file