class AccommodationTypesController < ApplicationController
  before_action :set_accommodation_type, only: [:show, :edit, :update, :destroy]

  # GET /accommodation_types
  # GET /accommodation_types.json
  def index
    @accommodation_types = AccommodationType.all
  end

  # GET /accommodation_types/1
  # GET /accommodation_types/1.json
  def show
  end

  # GET /accommodation_types/new
  def new
    @accommodation_type = AccommodationType.new
  end

  # GET /accommodation_types/1/edit
  def edit
  end

  # POST /accommodation_types
  # POST /accommodation_types.json
  def create
    @accommodation_type = AccommodationType.new(accommodation_type_params)

    respond_to do |format|
      if @accommodation_type.save
        format.html { redirect_to @accommodation_type, notice: 'Accommodation type was successfully created.' }
        format.json { render :show, status: :created, location: @accommodation_type }
      else
        format.html { render :new }
        format.json { render json: @accommodation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accommodation_types/1
  # PATCH/PUT /accommodation_types/1.json
  def update
    respond_to do |format|
      if @accommodation_type.update(accommodation_type_params)
        format.html { redirect_to @accommodation_type, notice: 'Accommodation type was successfully updated.' }
        format.json { render :show, status: :ok, location: @accommodation_type }
      else
        format.html { render :edit }
        format.json { render json: @accommodation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accommodation_types/1
  # DELETE /accommodation_types/1.json
  def destroy
    @accommodation_type.destroy
    respond_to do |format|
      format.html { redirect_to accommodation_types_url, notice: 'Accommodation type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_accommodation_type
    @accommodation_type = AccommodationType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def accommodation_type_params
    params.require(:accommodation_type).permit(:name)
  end
end
