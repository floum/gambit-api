require 'rails_helper'

RSpec.describe "RepertoireMoves", type: :request do
  describe "create" do
    it "returns http created" do
      repertoire = Repertoire.create
      move = Move.create

      post "/repertoire_moves",
        params: {
          repertoire_move:
          {
            move_id: move.id,
            repertoire: {
              id: repertoire.id
            }
          }
        }
      expect(response).to have_http_status(:created)
    end
  end

end
