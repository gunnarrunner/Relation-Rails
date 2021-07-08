class DiscsManufacturer < ApplicationRecord
  has_many :discs

  def most_recent_disc_created
    require "pry"; binding.pry
  end
end
