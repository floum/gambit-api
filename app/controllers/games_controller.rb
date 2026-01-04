class GamesController < ApplicationController
  def index
    @games = Game.all
    render json: @games
  end

  def show
    @game = Game.find(params[:id])
    render json: @game
  end

  def create
    @game = Game.new(
      pgn: game_params[:pgn],
      white: game_params[:white],
      black: game_params[:black],
      played: game_params[:played],
      result: game_params[:result]
    )
    game_params[:moves].each do |move_params|
      move = Move.find_or_create_by(move_params)
      @game.game_moves << GameMove.new(move: move, game: @game)
    end
    if @game.save
      render json: @game, status: 201
    else
      render json: @game.errors, status: 400
    end
  end

  private

  def game_params
    params.require(:game).permit(:pgn, :white, :black, :played, :result, moves: [Move::ATTRIBUTES])
  end
end
