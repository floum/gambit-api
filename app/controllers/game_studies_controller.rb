class GameStudiesController < ApplicationController
  def index
    @game_studies = GameStudy.all
    render json: @game_studies
  end

  def show
    @game_study = GameStudy.find(params[:id])
    render json: @game_study, include: [:game, :game_study_moves]
  end

  def update
    @game_study = GameStudy.find(params[:id])
    @game_study.update_attributes(game_study_params)
    render json: @game_study
  end

  private

  def game_study_params
    params.require(:game_study).permit(:moves)
  end
end
