require 'sinatra'
require 'omniauth'
require 'omniauth-twitter'
require 'omniauth-facebook'

set :sessions, true
use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :twitter, ENV['TW_API_KEY'], ENV['TW_API_SECRET']
  provider :facebook, ENV['FB_API_KEY'], ENV['FB_API_SECRET']
end

get '/' do
  <<-HTML
  <div><a href='/auth/twitter'><img src="https://g.twimg.com/dev/sites/default/files/images_documentation/sign-in-with-twitter-gray.png" alt="Sign in with Twitter"/></a></div>
  <div><a href='/auth/facebook'>Sign in with Facebook</a></div>
  HTML
end

get '/auth/:provider/callback' do
  auth = request.env['omniauth.auth']
  "Hello #{auth['info']['name']}"
end

