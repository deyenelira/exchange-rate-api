class HistoricsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @historics = Historic.all
  end

  def show
    @historic = Historic.find(params[:id])
    
  end

  def create
    @historic = Historic.new(api_params)

    if @historic.save
      render json: @historic, status: :created
    else
      render json: @historic.errors, status: :unprocessable_entity
    end
  end

  private 

  def api_params
    params.permit(:id, :success, :timestamp, :historical, :base, :date, rates: %i[USD])
  end
end
