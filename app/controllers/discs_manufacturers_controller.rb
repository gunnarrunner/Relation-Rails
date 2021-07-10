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

  def create
    new_discs_manufacturer = DiscsManufacturer.create({
      name: params[:name], #why does task manager have title: params[:tasks][:title]
      location: params[:location],
      international: params[:international],
      variety_of_discs: params[:variety_of_discs]
      })
    
      new_discs_manufacturer.save
      redirect_to '/discs_manufacturers'
  end
end
