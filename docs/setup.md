# Setup

## Installation

Cloning the repository.
```
$ git clone https://github.com/WIttyJudge/discussion
```

Go to the project
```
$ cd discussion
```

Install gem dependencies and prepare front-end.
```
$ bundle install
$ yarn install
```

Copy ``.env.example`` file to ``.env`` file and configure it.

Setup your PostgreSQL settings in ``.env`` file.

Also we are using Redis for caching, you can run it locally using docker we've created.
```
# docker-compose up -d
 -> Starting redis-6.0.9 ... done
```

Run ``rails dev:cache`` to toggle caching in development environment.

## Init Database

Type this command to create database, start migration and add testing data.

```
$ rails db:{create,migrate,seed}
```

## Sidekiq

Init redis server and then type this:

```
$ bundle exec sidekiq
```
