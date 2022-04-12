class HistoricsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @historics = Historic.all

    render json: @historics
  end

  def create
    @historic = Historic.new(api_params)

    if @historic.save
      render json: @historic, status: :created
    else
      render json: @historicr.errors, status: :unprocessable_entity
    end
  end

  private 

  def api_params
    params.permit(:success, :timestamp, :historical, :base, :date, rates: %i[USD])
  end
end
