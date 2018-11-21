### Deploying Sinatra Apps

#### Configuring an Application for Deployment

1. Remove any reloading code so it doesn't reload in production:

Sinatra provides `development?` and `production?` methods whose return values are determined by the `RACK_ENV` environment variable. The environment is set automically to `"production"` by Heroku.

```ruby
require "sinatra/reloader" if development?
```

2. Specify a Ruby version in your `Gemfile` so that Heroku knows the version of Ruby to use with your project:

```ruby
  ruby '2.4.1'
```

3. Configure your application to use a production web server (WEBrick is not an appropriate production web server, as it doesn't allow multi-threading):

```ruby
group :production do
  gem 'puma'
end
```
4. Create a `config.ru` file in the root of the project that tells the web server how to start the application:

```ruby
require './book_viewer'
run Sinatra::Application
```

5. Create a `Procfile` file in the root of the project with the following:

```ruby
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
```

A project's `Procfile` determines what processes should be started when the application boots up.

6. You can test your `Profile` locally

Use the `heroku local` command to boot the project locally in the same way that it will be once it's pushed to Heroku. This provides an opportunity to troubleshoot problems in your local development environment.

#### Creating a Heroku Application

1. Create a Heroku application using heroku apps:create $NAME, where $NAME is the application name you wish to use. If you don't provide this value, Heroku will generate a random application name for you.

```ruby
heroku apps:create $NAME
```

2. Push the project to the new Heroku application using `git push heroku master`

Make sure that you have checked-in all the updated files to your master branch before pushing to Heroku

Otherwise, if you have been working in a branch, you can push that branch to Heroku by specifying its name when pushing:

```ruby
git push heroku local-branch-name:master
```

3. Visit your application and verify that everything is working.

4. Recall that we are expecting Heroku to automatically set the `RACK_ENV` environment variable to "production". To see how this works, run `heroku config` in the application's directory after deploying to Heroku:

#### Summary

1. `Procfile` defines what types of processes are provided by the application and how to start them.

2. `config.ru` tells the web server how to start the application. In this project, we require the file that contains the Sinatra application and then start it.

3. While WEBrick is a fine web server for development, it is better to use a production-ready web server such as Puma when deploying a project.

4. Puma is a threaded web server, which means that it can handle more than one request at a time using a single process. As a result, Puma will perform much better for most applications.

5. A specific version of Ruby can be specified in the `Gemfile` to ensure that the same version is used in both development and production.
