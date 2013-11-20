class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /gears
  def index
    @gears = Gear.all
    respond_with @gears
  end

  # GET /gears/1
  def show
  end

  # GET /gears/new
  def new
    @gear = Gear.new
  end

  # GET /gears/1/edit
  def edit
  end

  # POST /gears
  def create
    @gear = Gear.new(gear_params)

    if @gear.save
      redirect_to @gear, notice: 'Gear was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /gears/1
  def update
    if @gear.update(gear_params)
      redirect_to @gear, notice: 'Gear was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /gears/1
  def destroy
    @gear.destroy
    redirect_to gears_url, notice: 'Gear was successfully destroyed.'
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
