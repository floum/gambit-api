class RepertoiresController < ApplicationController
  def create
    @repertoire = Repertoire.new(repertoire_params)
    if @repertoire.save
      render json: @repertoire, status: 201
    else
      render nil, status: 400
    end
  end

  def index
    @repertoires = Repertoire.all
    render json: @repertoires
  end

  def show
    @repertoire = Repertoire.find(params[:id])
    render json: @repertoire, include: { repertoire_moves: { methods: [:fen, :san, :box, :crushing], rejected_moves: { methods: [:fen, :san] } } }
  end

  private

  def repertoire_params
    params.require(:repertoire).permit(:white, :name)
  end
end
