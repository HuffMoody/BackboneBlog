# Backbone Blog

A very simple blogging type application to try and get a handle on backbone.js.

## Requirements
- requires ruby 1.9.2 or higher

## Installation
- run `bundle` to get dependancies installed
- run `bundle exec rake db:migrate` to migrate the database (uses sqlite so no configuration necessary)
- run `bundle exec foreman start` to launch thin and faye
- visit [http://localhost:3000](http://localhost:3000) and check it out. Be sure to open up two browser windows to see some persistence in action.