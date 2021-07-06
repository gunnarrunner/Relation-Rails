class DiscsManufacturersController < ApplicationController
  def index
    @discs_manufacturers = DiscsManufacturer.all
  end

  def new
  end

  def show
    @discs_manufacturer = DiscsManufacturer.find(params[:id])
  end
end
