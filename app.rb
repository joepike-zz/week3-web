require 'sinatra/base'
require 'pry'
require './lib/player'

class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, "Arbitrary session name"

  STARTING_HP = 100

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1 = Player.new(params[:player1])
    $player2 = Player.new(params[:player2])
    # session['hitpoint'] = params[:hitpoint]
    redirect '/play'
  end

  get '/play' do
    @player1 = $player1
    @player2 = $player2
    @hp_player1 = $player1.hitpoints
    @hp_player2 = $player2.hitpoints
    # @hitpoints = session['hitpoint']
    erb(:play)
  end

  get '/attack' do
    @player1 = $player1
    @player2 = $player2
    @player1.attack(@player2)
    erb(:attack)
  end

  run! if app_file == $0
end
