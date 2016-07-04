# Tiny URL Shortener

Live [demo](https://scenic-hawaii-volcanoes-39639.herokuapp.com/). A URL shortener service built with Ruby On Rails

# Application

* Ruby version
  * ruby 2.0.0p648

* System dependencies
  * Ruby On Rails - Rails 4.2.6
  * Postgresql

* Configuration
  * HashId salt and Minimun lenght set in config/secrets.yml
  * appHost to be used when generating the tinyUrl set in config/environments/*.rb 
  ```ruby
    config.appHost = ENV['APP_HOST'] || 'http://localhost:3000'
  ```
* Database creation, migration and seed
  * rake db:setup

* How to run the test suite
  * rake test

* How to start server
  * Considering that postgresql is running, execute `rails s` to fire up the rails server
