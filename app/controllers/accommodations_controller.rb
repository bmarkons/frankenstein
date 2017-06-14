class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: [:show, :edit, :update, :destroy]
  before_action :set_places, except: [:index, :my, :destroy]
  before_action :check_admin, only: []
  before_action :check_manager, only: [:new, :edit, :create, :update, :destroy, :my]
  before_action :check_user, only: []
  before_action :check_admin_or_user, only: [:index]

  def index
    @accommodations = if current_user.type == "manager"
                        current_user.accommodations
                      elsif current_user.type == "admin"
                        Accommodation.all
                      elsif current_user.type == "user"
                        Accommodation.approved
                      end
  end

  def show
  end

  def new
    @accommodation = Accommodation.new
  end

  def edit
  end

  def create
    @accommodation = current_user.accommodations.build(accommodation_params)

    if @accommodation.save
      redirect_to @accommodation, notice: 'Accommodation was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @accommodation.update(accommodation_params)
        format.html { redirect_to @accommodation, notice: 'Accommodation was successfully updated.' }
        format.json { render :show, status: :ok, location: @accommodation }
      else
        format.html { render :edit }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @accommodation.destroy
    respond_to do |format|
      format.html { redirect_to accommodations_url, notice: 'Accommodation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my
    @accommodations = current_user.accommodations
  end

  private

  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end

  def set_places
    @places = Place.all
  end

  def check_admin
    ActionController::RoutingError.new("Not found") unless current_user.admin?
  end

  def check_manager
    ActionController::RoutingError.new("Not found") unless current_user.manager?
  end

  def check_user
    ActionController::RoutingError.new("Not found") unless current_user.user?
  end

  def check_admin_or_user
    check_admin || check_user
  end

  def accommodation_params
    params.require(:accommodation).permit(:name, :description, :address, :average_grade, :latitude, :longitude, :image_url, :approved, :place_id)
  end
end
