class MovesController < ApplicationController
  def random
    @move = Move.order('random()').first
    render json: @move
  end

  def create
    @move = Move.new(move_params)
    if @move.save
      render json: @move
    else
      render json: @move.errors
    end
  end

  private

  def move_params
    params.permit(:san, :lan, :from, :color, :to, :before, :after, :flags, :piece)
  end
end
