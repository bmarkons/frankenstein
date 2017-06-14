class Admin::AccommodationTypesController < ApplicationController
  before_action :set_accommodation_type, only: [:show, :edit, :update, :destroy]

  def index
    @accommodation_types = AccommodationType.all
  end

  def show
  end

  def new
    @accommodation_type = AccommodationType.new
  end

  def edit
  end

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

  def destroy
    @accommodation_type.destroy
    respond_to do |format|
      format.html { redirect_to accommodation_types_url, notice: 'Accommodation type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_accommodation_type
    @accommodation_type = AccommodationType.find(params[:id])
  end

  def accommodation_type_params
    params.require(:accommodation_type).permit(:name)
  end
end
