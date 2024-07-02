# README

## Setup
- A `bundle install` should get you most of the way there.
- Enable caching with `rails dev:cache` to have weather calls cached locally.
- `bin/dev` to run the server.
- `rails test:all` to run unit and system tests.

### Optional
- To get Autocomplete working, you'll need a [Google Cloud API key](https://developers.google.com/maps/documentation/javascript/place-autocomplete#get-started).

## Tech Stack
- Ruby on Rails
- TailwindCSS

## Todos
- Add Rubocop
- Test international
- Headless chrome
- Component library
- Bad input handling (bad zip, no match, etc.)
- Remove lat/long support
- DRY Cache Key
- Error handling on Weather Service API call
- Test Caching
- Rename forecast
- Could keep wrapping responses
- Compare other APIs
- Better front end form error handling
- Validate zip before lookup

## Dependencies
- Dependent on location lookup, could build table of zips -> lat/long to remove dependency

## Decisions
- Requiring an address for input instead of just zip code per the PRD.
- Using SQLite and Memory store to keep this easier to run on other dev environments, but we'd want to do something different for a prod service.
- View Components are out of scope
- I may have expanded scope with the Google Autocomplete stuff, I was originally going to use it to get lat/long for the weather API I had planned on using, but ended up using a different API that included geocoding and current day high/low.

## Followups
- Support Celsius
