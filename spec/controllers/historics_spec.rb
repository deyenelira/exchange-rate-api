require 'rails_helper'

RSpec.describe HistoricsController, type: :controller do

  describe 'GET /historics' do
    it 'returns success status' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /historics/:id' do
    it 'returns success status' do
      historic = FactoryBot.create(:historic)
      get :show, params: { id: historic.id } 
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /historics' do
    scenario 'valid historic attributes' do
      post :create, params: {
        success: true,
        timestamp: 1650135543,
        base: 'BRL',
        date: '2022-04-16',
        rates: {'USD' => 0.212671}
      }
      expect(response).to have_http_status(201)
    end

    scenario 'invalid historic attributes' do
      post :create, params: {
        success: true,
        timestamp: 1650135543,
        rates: {'USD' => 0.212671}
      }
      expect(response).to have_http_status(422)
    end
  end
end
