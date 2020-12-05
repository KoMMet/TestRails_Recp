class Api::V1::TrecipsController < ApiController
  before_action :set_trecip, only: [:show]

rescue_from ActiveRecord::RecordNotFound do |exception|
  render json: {error: '404 not found'}, status: 404
end

def index
  trecips = Trecp.all
  render json: trecips
end

def show
  render json: @trecip
end

private

  def set_trecip
    @trecip = Trecp.find(params[:id])
  end
end
