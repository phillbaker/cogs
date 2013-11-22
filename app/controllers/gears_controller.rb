class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :update, :destroy]
  respond_to :json

  # GET /gears
  def index
    @gears = Gear.all
    respond_with @gears
  end

  # GET /gears/1
  def show
  end

  # POST /gears
  def create
    @gear = Gear.new(gear_params)

    if @gear.save
      render :show, notice: 'Gear was successfully created.'
    else
      render :json => { :errors => @gear.errors.full_messages }, :status => :unprocessible_entity
    end
  end

  # PATCH/PUT /gears/1
  def update
    if @gear.update(gear_params)
      render :show, notice: 'Gear was successfully updated.'
    else
      render :json => { :errors => @gear.errors.full_messages }, :status => :unprocessible_entity
    end
  end

  # DELETE /gears/1
  def destroy
    @gear.destroy
    render :json => {}, :status => :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gear
      @gear = Gear.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gear_params
      params.require(:gear).permit(:teeth, :radius)
    end
end
