This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# The testing done using RSPEC 
## Rails CI Workflow

This repository includes a GitHub Actions workflow for automatically testing a Ruby on Rails application using RSpec whenever code is pushed or a pull request is created.

## Overview

The workflow file — .github/workflows/rails-ci.yml — defines a continuous integration (CI) process that ensures all tests pass before merging new code.

Workflow name: Rails CI
Triggers:
##### On every push to any branch
##### On every pull_request

## Workflow Summary
Step	Description
1. Checkout code Retrieves your repository’s latest code from GitHub.
2. Setup Ruby Sets up Ruby 3.2 with bundler caching to improve performance.
3. Install dependencies	Installs Bundler and all required gems from your Gemfile.
4. Setup database Creates and migrates the test database (using SQLite by default).
5. Run RSpec tests Runs your Rails test suite using bundle exec rspec.