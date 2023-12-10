# README

## Newsstand

A simple enough news stand where user can add in their favorite news publishers' RSS or APIs
and have their own personal newsstand delivered to their browser.

### Tech stack
- Ruby 3.1.0
- Rails 7
- Sidekiq
- Redis
- Postgresql
- Bootstrap

### Features
- Publisher registration with multiple methods to pull in data
- Feed Methods to pull data
  - RSS
  - API
  - Web Scraper(not yet built)
- Article pagination and filter by language
- Error Recording
  - Retry mechanism

### Considerations
- Add tests to ensure Anti Corruption Layers work
- Add tests to mock RSS responses and failures
- Robust error handling
- Add Notifications for Errors
- Add Email summary of latest subscribed news
- Delayed jobs to download images from source and store in DB
- Containerization of services
- Add caching layer to mitigate request and responses

![alt text](https://github.com/tunamsyar/newstand/blob/master/public/sample.png?raw=true)

