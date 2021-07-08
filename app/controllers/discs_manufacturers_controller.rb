class DiscsManufacturersController < ApplicationController
  def index
    @discs_manufacturers = DiscsManufacturer.order_by_creation
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
