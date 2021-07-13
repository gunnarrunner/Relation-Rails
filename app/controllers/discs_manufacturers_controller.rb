class DiscsManufacturersController < ApplicationController
  def index
    @discs_manufacturers = DiscsManufacturer.order_by_creation
  end

  def new
    # @discs_manufacturer = DiscsManufacturer.find(params[:id])
  end
  def show
    @discs_manufacturer = DiscsManufacturer.find(params[:id])
  end

  def discs
    @manufacturer = DiscsManufacturer.find(params[:discs_manufacturer_id])
    if params[:alphabetical] # == 'true'
      @discs = @manufacturer.discs.sort_discs_by_alpha
    elsif params[:number]
      @discs = @manufacturer.discs.over_threshold(params[:number])
    else
      @discs = @manufacturer.discs
    end
  end

  def create
    new_discs_manufacturer = DiscsManufacturer.create(discs_manufacturer_params)
    new_discs_manufacturer.save
    redirect_to '/discs_manufacturers'
  end

  def edit
    @discs_manufacturer = DiscsManufacturer.find(params[:id])
  end

  def update
   discs_manufacturer = DiscsManufacturer.find(params[:id])
   discs_manufacturer.update(discs_manufacturer_params)
   redirect_to '/discs_manufacturers'
  end

  def destroy
    discs_manufacturer = DiscsManufacturer.find(params[:id])
    discs_manufacturer.destroy
    redirect_to '/discs_manufacturers'

  end

private

  def discs_manufacturer_params
    params.permit(:name, :location, :international, :variety_of_discs)
  end
end
