require 'test_helper'

class ExchangeRateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/exchange_rate/latest_rate'
    assert_response :success
  end

  test "should get indexxx" do
    get '/exchange_rate/historical_rates', params: { start_date: '2022-04-10', end_date: '2022-04-12' }
    assert_response :success
  end
end
