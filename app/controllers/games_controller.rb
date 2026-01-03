class GamesController < ApplicationController
  def index

  end

  def create
    @game = Game.new(game_params)
    if @game.save
      render json: @game, status: 201
    else
      render json: @game.errors, status: 400
    end
  end

  private

  def game_params
    params.permit(:pgn)
  end
end
