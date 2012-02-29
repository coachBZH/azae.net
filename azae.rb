require 'rubygems'
require 'haml'
require 'bundler/setup'

require 'sinatra'

configure do
  set :haml, :format => :html5
end

get '/' do
  haml :index
end

get '/devops' do
  haml :devops
end
