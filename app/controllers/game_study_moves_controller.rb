class GameStudyMovesController < ApplicationController
  def create
    @move = Move.find_or_create_by(game_study_move_params)
    @game_study = GameStudy.find(params[:game_study_id])
    @game_study_move = GameStudyMove.new(
      game_study: @game_study,
      move: @move
    )
    if @game_study_move.save
      render json: @game_study_move, status: 201
    end
  end

  private

  def game_study_move_params
    params.require(:move).permit(Move::ATTRIBUTES)
  end
end
