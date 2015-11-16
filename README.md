# omniauth_sinatra_sample
Super simple sinatra sample app for omniauth

# setup

```
$git clone https://github.com/nyamage/omniauth_sinatra_sample.git
$bundle install
$bundle exec rake db:migrate
```

# Get key and secret for twitter and facebook

## twitter

1. go to https://apps.twitter.com/ and register sample app
2. obtain api key and api secret
3. configure callback url ('http://yourdomain/auth/twitter/callback') for our sample app 

## facebook

1. go to https://developers.facebook.com/apps/ and register sample app
2. obtain api key and api secret
3. configure callback url ('http://yourdomain/auth/facebook/callback') for our sample app

# How to run

1. run sample app

```
$TW_API_KEY=<twitter api key> TW_API_SECRET=<twitter api secret> FB_APP_KEY=<facebook api key> FB_APP_SECRET=<facebook api secret> bundle exec omniauth_sample.rb
```

2. Open localhost:4567 by browser

3. Click sign in buttown then approve our sample code to access your account info

4. You will see your name on page

# Reference

- [omniauth](https://github.com/intridea/omniauth)
- [omniauth-twitter](https://github.com/arunagw/omniauth-twitter)
- [omniauth-facebook](https://github.com/mkdynamic/omniauth-facebook)
- [omniauth sinatra sample](https://github.com/intridea/omniauth/wiki/Sinatra-Example)
- [omniauth-facebook](https://github.com/arunagw/omniauth-twitter)
