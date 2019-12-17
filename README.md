# Team Messenger

A slack based system has the following features:
* Create channels
* Create teams
* send private messages between users

## Prerequisites

>You just need have docker-compose installed in your machine.

## Getting Started
>To get the app running, run the following commands:

  ```docker
    docker-compose build
    docker-compose run --rm webiste bundle install
    docker-compose run --rm website bundle exec rails db:create
    docker-compose run --rm website bundle exec rails db:migrate
    docker-compose up
  ```

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - Dependency Management
* [Materialize](https://materializecss.com/) - Dependency Management
* [RSpec](https://rspec.info/) - Dependency Management

## Authors

* **Lucas Brandão** - [brandaoplaster](https://github.com/brandaoplaster)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
