class RepertoireMovesController < ApplicationController
  def create
    @repertoire = Repertoire.find(repertoire_move_params[:repertoire][:id])
    @move = Move.find_or_create_by(repertoire_move_params[:move])

    @repertoire_move = RepertoireMove.find_by(repertoire: @repertoire, move: @move)

    if @repertoire_move
      render :nothing, status: 200
    else
      @repertoire_move = RepertoireMove.create(repertoire: @repertoire, move: @move)
      if @repertoire_move.save
        render :nothing, status: 201
      else
        render json: @repertoire_move.errors, status: 400
      end
    end
  end

  def destroy
    @repertoire_move = RepertoireMove.find(params[:id])

    if @repertoire_move.destroy
      render :nothing, status: 204
    else
      render :nothing, status: 400
    end
  end

  def update
    @repertoire_move = RepertoireMove.find(params[:id])

    if @repertoire_move.update(repertoire_move_params)
      render json: @repertoire_move, status: 200
    else
      render json: @repertoire_moves.errors, status: 400
    end
  end


  private

  def repertoire_move_params
    params.require(:repertoire_move).permit(:confirmed, repertoire: [:id], move: Move::ATTRIBUTES)
  end
end
