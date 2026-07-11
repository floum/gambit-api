class RejectedMovesController < ApplicationController
  def create
p params
  end

  private
  def rejected_move_params
    params.require(:rejected_move).require(:fen, :san)
  end
end
