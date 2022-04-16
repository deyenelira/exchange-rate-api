require 'rails_helper'

RSpec.describe ExchangeRateController, type: :controller do

  describe 'GET /latest_rate' do
    it 'returns success status' do
      get :latest_rate
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /historical_rates' do
    it 'is valid with valid params' do
      get :historical_rates, params: { :start_date => '2022-04-10', :end_date => '2022-04-12' } 
      expect(response).to have_http_status(200)
    end

    it 'is invalid with invalid params' do
      get :historical_rates, params: { :start_date => '', :end_date => '2022-04-12' } 
      expect(response).to have_http_status(400)
    end

    it 'is invalid with invalid params' do
      get :historical_rates, params: { :start_date => '2022-04-10', :end_date => '' } 
      expect(response).to have_http_status(400)
    end

    it 'is invalid with invalid params' do
      get :historical_rates, params: { :start_date => '2022-04-12', :end_date => '2022-04-10' }
      expect(response).to have_http_status(400)
    end
  end
end
