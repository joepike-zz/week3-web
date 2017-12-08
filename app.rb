require 'sinatra/base'
require 'pry'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, "Arbitrary session name"

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new((params[:player1]), (params[:player2]))
    redirect '/play'
  end

  get '/play' do
    @player1 = $game.player1.name
    @player2 = $game.player2.name
    @hp_player1 = $game.player1.hitpoints
    @hp_player2 = $game.player2.hitpoints
    erb(:play)
  end

  get '/attack' do
    @player1 = $game.player1.name
    @player2 = $game.player2.name
    $game.attack(@player2)
    @hp_player2 = $game.player2.hitpoints
    erb(:attack)
  end

  run! if app_file == $0
end
