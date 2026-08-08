require 'rails_helper'

RSpec.describe "RejectedMoves", type: :request do
  describe "create" do
    it "returns http created" do
      repertoire = Repertoire.create
      move = Move.create
      post "/rejected_moves", 
        params: { 
          rejected_move: {
            move_id: move.id, repertoire_id: repertoire.id 
          }
        }
      expect(response).to have_http_status(:created)
    end
  end

end
