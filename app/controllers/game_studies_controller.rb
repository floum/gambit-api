class GameStudiesController < ApplicationController
  def index
    @game_studies = GameStudy.all
    render json: @game_studies, include: [:game], methods: :progress
  end

  def show
    @game_study = GameStudy.find(params[:id])

    render json: @game_study, 
      include: {
        game_study_moves: { methods: :san },
      },
      methods: [:expected_moves, :complete]
  end

  def update
    @game_study = GameStudy.find(params[:id])
    @game_study.update_attributes(game_study_params)
    render json: @game_study
  end

  def create
    @game_study = GameStudy.new(game_study_params)
    if @game_study.save
      render json: @game_study
    else
      render json: @game_study.errors, status: 400
    end
  end

  private

  def game_study_params
    params.require(:game_study).permit(:moves, :color, :game_id)
  end
end
