# README

Simple api app to show off JWT with some simple restful actions

The idea was to pull down the brewery db and send off push notifications when new beers were released in my area.  However, I would have had to pull down most of their db, or use webhooks for beer updates then find out if the beer was local.  This didn't satisfy the task I was given, so I did this.

The app pulls down the breweries and beers for CO.

Then lists all beers at /beers

It also lists all of the current user's favorite beers at /favorites.  But this requires a JWT token

To get a token POST /user_token with the params {auth: email: foo@test.com, password: 'yagni'}
curl -i -X POST -d 'auth[email]'='foo@bar.com' -d 'auth[password]'='yagni123' http://localhost:3000/user_token

The jwt is in the body.
Pass that in as a header to the favorites request
curl -i --header 'Authorization: Bearer JWT_TOKEN' http://localhost:3000/favorites

You can also POST to /favorites with a param {beer_id: 123} to add that beer to the user's favorites.
