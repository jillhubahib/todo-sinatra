# Todo List in Sinatra

## Learning Objective
- Know Rack (a Ruby webserver interface)
- Know Sinatra
- Learn UI testing with RSpec and Capybara/Selenium
- Deployment to Heroku

## [Rack](https://rack.github.io/)

Rack provides a minimal interface between webservers that support Ruby and Ruby frameworks.
![alt Rack][rack]

[rack]: https://i2.wp.com/www.rubyguides.com/wp-content/uploads/2018/09/rack-stack-1.png?zoom=2&resize=417%2C384&ssl=1

## Sinatra
Sinatra is a [DSL](http://webapps-for-beginners.rubymonstas.org/sinatra/dsl.html) for quickly creating web applications in Ruby with minimal effort:

```ruby
require 'sinatra'
get '/frank-says' do
  'Put this in your pipe & smoke it!'
end
```

### Styles
- Classic - generally used more when creating smaller micro-sites or apps, usually run from a single application file
- Modular - simply a way to write your app as independent modules that can run within the same parent application

### MVC
MVC is an architectural pattern that separates an application into three main logical components: Model, View and Controller.
![alt MVC][mvc]

[mvc]: https://www.guru99.com/images/1/122118_0445_MVCTutorial1.png
## Requirements
- [ ] User can able to sign up and login/logout
- [ ] User can add a todo
- [ ] User can complete a todo
- [ ] User can remove a todo or clear all todos
- [ ] User can show all todos
- [ ] User can import and export a todo from and to a file (assignment)

## Dependencies
- [Puma](http://puma.io/) - Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications.

### Assets
- [Bootstrap](https://github.com/twbs/bootstrap-rubygem)
- [Sprockets](https://github.com/rails/sprockets) - Rack-based asset packaging system that concatenates and serves JavaScript, CoffeeScript, CSS, LESS, Sass, and SCSS.
- [Uglifier](https://github.com/lautis/uglifier) - Ruby wrapper for UglifyJS JavaScript compressor

### Data Persistence
- [ActiveRecord](https://guides.rubyonrails.org/active_record_basics.html)
- [sinatra-activerecord](https://github.com/janko/sinatra-activerecord) - Extends Sinatra with ActiveRecord helpers
- [rake](https://github.com/ruby/rake) - task runner needed by ActiveRecord
- [pg](https://github.com/ged/ruby-pg) - Ruby interface to the {PostgreSQL RDBMS}
- [bcrypt](https://github.com/codahale/bcrypt-ruby) - Ruby binding for the OpenBSD bcrypt() password hashing algorithm, allowing you to easily store a secure hash of your users' passwords
- [require_all](https://github.com/jarmo/require_all) - A wonderfully simple way to load your code

### Development
- [rerun](https://github.com/alexch/rerun/) - Restarts your app when a file changes
- [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug) - Combine 'pry' with 'byebug'. These are Ruby debuggers
- [better_errors](https://github.com/BetterErrors/better_errors) - Provides a better error page for Rails and other Rack apps
- [binding_of_caller](https://github.com/banister/binding_of_caller) - Retrieve the binding of a method's caller
- [racksh](https://github.com/sickill/racksh) - Console for any Rack based ruby web app
- [tux](https://github.com/cldwalker/tux) - Tux dresses up sinatra in a shell

### Testing
- [Capybara](https://github.com/teamcapybara/capybara) - Capybara is an integration testing tool for rack based web applications. It simulates how a user would interact with a website
- [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner) - used to ensure a clean state of database for testing.
- [FactoryBot](https://github.com/thoughtbot/factory_bot) - provides a framework and DSL for defining and using factories - less error-prone, more explicit, and all-around easier to work with than fixtures.
- [Faker](https://github.com/stympy/faker) - library for generating fake data such as names, addresses, and phone numbers
- [Rake](https://www.rubyguides.com/2019/02/ruby-rake/) - popular task runner in Ruby.
- [Rspec](https://www.rubyguides.com/2018/07/rspec-tutorial) - test framework
- [Selenium](https://github.com/SeleniumHQ/selenium) - WebDriver is a tool for writing automated tests of websites. It aims to mimic the behaviour of a real user, and as such interacts with the HTML of the application


## [Code walkthrough](https://github.com/jillhubahib/todo-sinatra/commits/master)

## Deployment

- [Signup for free to Heroku](https://signup.heroku.com/) and [install its CLI tools](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)
- To create the app in heroku, in root folder, run command `heroku create`
- Add or install the [Heroku Postgres](https://elements.heroku.com/addons/heroku-postgresql) or you may run command `heroku addons:create heroku-postgresql:hobby-dev`
- Get your database name by running command `heroku pg:credentials:url` then you should have it in the connection info string in this example format `dbname=dfo64jarnki6c4`.
- Set the `DATABASE_NAME` by running example command `heroku config:set DATABASE_NAME=dfo64jarnki6c4`. Your database name will be different.
- Deploy code to heroku `git push heroku master`
- Run migration `heroku run bundle exec rake db:migrate`
- Open your app `heroku open`

## Testing

`bundle exec rspec`

## Resources
- [A Web Server vs. an App Server](https://www.justinweiss.com/articles/a-web-server-vs-an-app-server/)
- [Ruby Web Servers](http://techtales.co/2017/09/07/comparison-web-servers-ruby-web-applications/)
- [Rack Explained For Ruby Developers](https://www.rubyguides.com/2018/09/rack-middleware/)
- [A video about Rack](https://thoughtbot.com/upcase/videos/rack)
- [What is Rack in Ruby](https://medium.com/whynotio/what-is-rack-in-ruby-7e0615f1d9b6)
- [Sinatra vs Rails](http://webapps-for-beginners.rubymonstas.org/sinatra/sinatra_rails.html)
- [MVC Tutorial](https://www.guru99.com/mvc-tutorial.html)
- [What is a resource](http://webapps-for-beginners.rubymonstas.org/resources/groups_routes.html)