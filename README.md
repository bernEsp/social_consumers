# README

### Setup
1. `bundle`
2. `bundle exec rails db:create`
3. `bundle exec rails db:migrate`
4. `bundle exec rails db:test:prepare`


This stadium goods test. It reports on json dashboard `localhost:3000`
the twitter, instagram, and facebook posts.

In order to run server you have to run the server but before schedule task to
collect social network information

1- Schedule consumer
`bin/schedule`

2. Run rails server
`bundle exec rails s`

3. Open another tab and run the sidekiq process
`bundle exec sidekiq`

Now you can visit `http://localhost:3000` and get the JSON response with
following data:

* twitter
* Facebook
* Instagramm


### Test

`bundle exec rails test`

### Stop schedule job
run `bin/cleanschedule`

### Fix Cron in MacOs
https://dccxi.com/posts/crontab-not-working-catalina/#:~:text=Aug%206%2C%202019-,If%20Any%20of%20Your%20Crontab%20Tasks%20No%20Longer%20Works%20on,lists%20located%20at%20System%20Preferences.
