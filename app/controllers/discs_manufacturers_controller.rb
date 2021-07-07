class DiscsManufacturersController < ApplicationController
  def index
    @discs_manufacturers = DiscsManufacturer.all
  end

  def show_discs
    @discs = Disc.where(discs_manufacturer_id: DiscsManufacturer.find(params[:id]))
  end


end
