require 'test_helper'

class HistoricsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historic = historics(:one)
  end

  test "should get index" do
    get historics_url
    assert_response :success
  end

  test "should create historic" do
    assert_difference('Historic.count') do
      post historics_url, params: { base: @historic.base,
                                    date: @historic.date,
                                    historical: @historic.historical,
                                    rates: @historic.rates,
                                    success: @historic.success,
                                    timestamp: @historic.timestamp }
    end

    assert_response :created
  end
end
