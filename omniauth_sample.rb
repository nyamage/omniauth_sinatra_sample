require 'sinatra'
require 'omniauth'
require 'omniauth-twitter'
require 'omniauth-facebook'
require_relative './models/user'

set :sessions, true

use OmniAuth::Builder do
  provider :twitter, ENV['TW_API_KEY'], ENV['TW_API_SECRET']
  provider :facebook, ENV['FB_API_KEY'], ENV['FB_API_SECRET']
end

def authenticate
  return User.find_by_id(session[:user_id])
end

get '/' do
  <<-HTML
  <div><a href='/auth/twitter'><img src="https://g.twimg.com/dev/sites/default/files/images_documentation/sign-in-with-twitter-gray.png" alt="Sign in with Twitter"/></a></div>
  <div><a href='/auth/facebook'>Sign in with Facebook</a></div>
  <div><a href='/protected'>Protected Page</a></div>
  HTML
end

get '/auth/:provider/callback' do
  auth = request.env['omniauth.auth']
  # find user object with type and uid
  # redirect to home page
  user = User.find_by(:provider => auth['provider'], :uid => auth['uid'])
  unless user.nil?
    session[:user_id] = user.id
    redirect '/protected'
  end
  # if user object is not found, 
  # create user object and redirect to home page
  user = User.create(:provider => auth['provider'], :uid => auth['uid'], :name => auth['info']['name'], :profile_image => auth['info']['image'], 
			:token => auth['credentials']['token'], :secret => auth['credentials']['secret'])
  session[:user_id] = user.id
  redirect '/protected'
end

get '/protected' do
  user = authenticate
  if user.nil?
    redirect '/'
  end

  "<img src=#{user.profile_image}/><div>Hello #{user.name}</div>"
end
