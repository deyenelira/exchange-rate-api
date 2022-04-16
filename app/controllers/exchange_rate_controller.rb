# main controller
class ExchangeRateController < ApplicationController

  def latest_rate
    @response = LatestRate.new.call

    respond
  end

  def historical_rates
    @response = HistoricalRates.new(api_params[:start_date],
                                    api_params[:end_date]).call
    respond
  end

  def respond
    if @response
      render json: @response[:data], status: 200
    else
      render json: { error: 'Invalid Host' }, status: :bad_request
    end
  end

  def api_params
    params.permit(:start_date, :end_date)
  end
end
