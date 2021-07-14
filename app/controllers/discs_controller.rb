class DiscsController < ApplicationController
  def index
    @discs = Disc.discs_in_production #too much logic?
    # @discs = Disc.discs_in_production
    #if button gets clicked.... index changes to Disc.sorts_discs_by_alpha
  end

  def new
    # require "pry"; binding.pry
    # @discs_manufacturer = DiscsManufacturer.find(params["#{@discs_manufacturer.id}"])
    @discs_manufacturer = DiscsManufacturer.find(params[:discs_manufacturer_id])
  end

  def show
    @disc = Disc.find(params[:id])
  end

  def create
    new_disc = Disc.create(discs_params)
    new_disc.save
    redirect_to "/discs_manufacturers/#{new_disc.discs_manufacturer_id}/discs"
  end

  def edit
    @disc = Disc.find(params[:id])
  end

  def update
    disc = Disc.find(params[:id])
    disc.update(discs_params)
    redirect_to '/discs'
  end

  def destroy
    disc = Disc.find(params[:id])
    disc.destroy
    redirect_to '/discs'
  end

private

  def discs_params
    params.permit(:name, :in_production, :speed, :discs_manufacturer_id)
  end
end
