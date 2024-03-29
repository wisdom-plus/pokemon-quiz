require 'rails_helper'

RSpec.describe 'Quizzes', type: :request do
  describe 'GET /result' do
    it 'returns http success' do
      get '/quizzes/result'
      expect(response).to have_http_status(:success)
    end
  end
end
