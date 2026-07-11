require 'rails_helper'

RSpec.describe "RejectedMoves", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/rejected_moves/create"
      expect(response).to have_http_status(:success)
    end
  end

end
