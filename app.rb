require 'sinatra/base'
require 'pry'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions
  # set :session_secret, "Arbitrary session name"

  get '/' do
    erb(:index)
  end

  post '/names' do
    p params
    player_1 = Player.new(params[:player1])
    player_2 = Player.new(params[:player2])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    p @game.player_1
    erb(:play)
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.player_2)
    erb(:attack)
  end

  run! if app_file == $0
end
