Api Auth Sample
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Getting Started
---------------

You will need postgresql database and nodejs installed.

```bash
git clone https://github.com/tmwh/api_auth-sample.git
cd api_auth-sample
bundle install
rake db:setup
rails s
```

Go to http://lvh.me:3000/ and register to get the id and secret.

```bash
bin/sample_client your_client_id your_secret http://lvh.me:3000/api/v1/users/all
```
