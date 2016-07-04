# Tiny URL Shortener

Live [demo](http://tfy.herokuapp.com/). A URL shortener service built with Ruby On Rails

# Application

* Ruby version
  * ruby 2.0.0p648

* System dependencies
  * Ruby On Rails - Rails 4.2.6
  * Postgresql

* Configuration
  * **HashId salt** and **Minimun length** set in config/secrets.yml
  * appHost to be used when generating the tinyUrl set in config/environments/*.rb 
  `config.appHost = ENV['APP_HOST'] || 'http://localhost:3000'`
* Database creation, migration and seed
  * `rake db:setup`

* How to run the test suite
  * `rake test`

* How to start the server
  * Considering that postgresql is running, execute `rails s` to fire up the rails server
