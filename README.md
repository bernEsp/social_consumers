# README

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
