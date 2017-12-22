# Rails 5 Example App

[![Codeship Status for K-and-R/rails-5-example](https://app.codeship.com/projects/5f1eab20-c8db-0135-1586-5e72f9d08083/status?branch=master)](https://app.codeship.com/projects/261636)
[![Maintainability](https://api.codeclimate.com/v1/badges/2dbf70a91b8988b3fa06/maintainability)](https://codeclimate.com/github/K-and-R/rails-5-example/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2dbf70a91b8988b3fa06/test_coverage)](https://codeclimate.com/github/K-and-R/rails-5-example/test_coverage)

## Development Environment
We are using Ubuntu (currently 16.04) for our development environments. Thus all documentaion will be for that environment unless explicitly specified otherwise. Many of the commands may work on MacOS and will likely not work at all on Windows (since Windows is frowned upon as a viable development environment, it is strongly recommended to install Ubuntu for a viable development machnine).

## Development Environment Setup
To set up a development environment, follow the [Development Environment Setup instructions](./docs/Development-Setup.md).

## Cloning this repo
Make a local copy of this Git repo:
```bash
mkdir -p ~/Projects/ExampleApp
cd ~/Projects/ExampleApp
git clone git@github.com:K-and-R/rails-5-example.git
cd rails-5-example
git checkout develop
```

## Ruby Version
We are presently using Ruby `2.4.3`. This is defined in the `.ruby-version` file. We are using `rbenv` for managing Ruby version in development environments.

## System Dependencies
* PostgreSQL
* Redis

## Configuration
Local configuration is defined in `config/settings.local.yml`, which is ignored by Git, and any local environment settings are defined there. Start with the example file and make changes accordingly.

```bash
git checkout develop
cp config/settings.local.{example.,}yml
```
