class DiscsManufacturersController < ApplicationController
  def index
    @discs_manufacturers = DiscsManufacturer.all
  end

  def new
  end

  def show
    @discs_manufacturer = DiscsManufacturer.find(params[:id])
  end

  def discs
    manufacturer = DiscsManufacturer.find(params[:discs_manufacturer_id])
    @discs = manufacturer.discs
  end
end
