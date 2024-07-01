# README

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

* ...

## Todos
- Add Rubocop
- Test international
- Headless chrome
- Component library
- Bad input handling (bad zip, no match, etc.)

## Dependencies
- Dependent on location lookup, could build table of zips -> lat/long to remove dependency

## Decisions
- Requiring an address for input instead of just zip code per the PRD.
- Using SQLite and Memory store to keep this easier to run on other dev environments, but we'd want to do something different for a prod service.
- View Components are out of scope
