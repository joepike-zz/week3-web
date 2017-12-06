require 'sinatra/base'
require 'pry'

class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, "Arbitrary session name"

  get '/' do
    erb(:index)
  end

  post '/names' do
    session['player1'] = params[:player1]
    session['player2'] = params[:player2]
    session['hitpoint'] = params[:hitpoint]
    redirect '/play'
  end

  get '/play' do
    @player1 = session['player1']
    @player2 = session['player2']
    @hitpoints = session['hitpoint']
    erb(:play)
  end

  run! if app_file == $0
end
