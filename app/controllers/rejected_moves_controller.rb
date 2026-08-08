class RejectedMovesController < ApplicationController
  def create
    p params
    @rejected_move = RejectedMove.new(rejected_move_params)
    if @rejected_move.save
      render json: @rejected_move, status: :created
    else
      render :nothing, status: 400
    end
  end

  private
  def rejected_move_params
    params.require(:rejected_move).permit(:move_id, :repertoire_id)
  end
end
