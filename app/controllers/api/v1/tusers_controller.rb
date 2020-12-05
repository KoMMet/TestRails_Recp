class Api::V1::TusersController < ApiController
  before_action :set_tuser, only: [:show, :update, :destroy]

rescue_from Exception, with: :render_status_500
rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

  def index
    tusers = Tuser.all
    render json: tusers
  end
  
  def show
    render json: @tuser
  end

  def create
    tuser = Tuser.new(tuser_params)
    if tuser.save
        render json: tuser, status: :created
    else
        render json: {errors: tuser.errors.full_message}, status: :unprocessable_entity
    end
  end

  def update
      if @tuser.update_attributes(tuser_params)
        head :no_content
      else
        render json: {errors: @tuser.errors.full_messages}, status: :unprocessable_entity
      end
  end

  def destroy
    @tuser.destroy!
    head :no_content
  end
  
  private
    def set_tuser
      @tuser = Tuser.find(params[:id])
    end

    def tuser_params
      params.fetch(:tuser,{}).permit(:name, :pass, :jointime)
    end

    def render_status_404(exception)
      render json: {errors: [exception]}, status: 404
    end

    def render_status_500(exception)
      render json: {errors: [exception]}, status: 500
    end
  
end

