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

## Notes

- I am prompting for an address for input instead of just zip code per the PRD.
- I scoped creeped a little with the Google Autocomplete feature. I wanted to make it easy for users to put their address in without having to do a multi-part form. Additionally, I had planned on using the lat/long from the response, but used a different weather service than originally intended that provided lat/long and the current days high/low.
- I didn't actually use the db, but we'd likely want to swap from SQLite to MySql, Postgres, or something else for a production app.

### Follow up features (no particular order)
- Pick a suitable cache_store for production (Solid Cache, MemCache, Redis, etc)
- Validate zip codes before fetching a weather report.
- Add tests for caching, perhaps `solid_cache` with database cleaning, perhaps a custom cache store allowing inspection, etc.
- Add support for Celsius.
- Add headless Chrome for system tests.
- Consider a component library like ViewComponents
- Improve frontend error handling
- Consider further building out `WeatherApi::Response` to prevent directly accessing hash in other parts of the system.
- Compare other APIs.
