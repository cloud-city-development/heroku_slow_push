# Heroku Slow Push

An example app demonstrating a technique for using background processing to increase app responsiveness and deal with [Heroku's Random Router issue](http://rapgenius.com/James-somers-herokus-ugly-secret-lyrics). We [blogged about it](http://blog.cloudcitydevelopment.com/?p=139).

# Setup

This app uses [Pusher](http://pusher.com) for WebSocket messaging back to the browser. Signing up for a basic account is free.

Pusher configuration is stored in environment variables.

For Heroku (at least 1 worker is required):
```
heroku config:set PUSHER_APP_ID=your_app_id PUSHER_KEY=your_key PUSHER_SECRET=your_secret
heroku run rake db:migrate db:seed
```

To run locally:
```
export PUSHER_APP_ID=your_app_id PUSHER_KEY=your_key PUSHER_SECRET=your_secret
bundle
rake db:create db:migrate db:seed
script/delayed_job start
rails s
```
