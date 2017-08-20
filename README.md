# ML@B Web Application

ML@B's server-side web application logic in Ruby, around the framework Rails, managing the interchange of data between the server and the ML@B members through back-end components and connections to APIs and web services, also fully integrated to front-end elements.

## Getting Started

If you as a member of ML@B would like to contribute, these instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You'll want to use rvm so that you can easily install and manage dependencies and versions. [(RVM one-liner)](https://rvm.io):

```
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ \curl -sSL https://get.rvm.io | bash -s stable
```

Run it, source rvm, and install and use the version of Ruby you want (at the time of writing this, the last commit was in 2.3.3p222).

Install Ruby on Rails('~> 5.0.0', '>= 5.0.5' atm).

### Clone/Fork

To get a development env running,

```
$ bundle install
$ rails db:migrate
$ rails db:seed
$ rails s
```

> **NOTE**: This app uses mySQL for both development(+ test) and production purposes. So if  db:migrate  fails on you, you do not have mySQL locally set up.
> In the Gemfile, switch out the gem 'mysql' with 'sqlite3', rebundle and migrate the database again.
>
> Or if you prefer and have postgres set up locally, you can use the 'pg' gem for development purposes.
>
> **But do not push this change to the repository**


For developing and testing member account functionalities, login at localhost:3000/members/sign_in with

```
login: admin@ml.berkeley.edu
password: foobar
```

Some pages may not load properly due to dependencies on secret keys (e.g. Facebook), so you'll have to ask me for the keys and set them as local environments in your system.

## Running the tests

```
$ rails t
```
You should not encounter any errors.
