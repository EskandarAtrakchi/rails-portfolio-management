This README would normally document whatever steps are necessary to get the
application up and running. 

You can access the project deployed on render.com 
https://rails-portfolio-management.onrender.com 

# The testing done using RSPEC 
## Rails CI Workflow

This repository includes a GitHub Actions workflow for automatically testing a ruby on rails application using RSpec whenever code is pushed or a pull request is created.

## Overview

The workflow file .github/workflows/rails-ci.yml defines a continuous integration (CI) process that ensures all tests pass before merging new code.

Workflow name: Rails CI
Triggers:
##### On every push to any branch
##### On every pull_request

## Workflow Summary
Step	Description
1. Checkout code Retrieves repository’s latest code from GitHub.
2. Setup Ruby Sets up Ruby 3.2 with bundler caching to improve performance.
3. Install dependencies	Installs Bundler and all required gems from Gemfile.
4. Setup database creates and migrates the test database (using SQLite by default).
5. Run RSpec tests runs Rails test suite using bundle exec rspec.
