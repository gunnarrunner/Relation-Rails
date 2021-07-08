class DiscsManufacturer < ApplicationRecord
  has_many :discs

  def self.order_by_creation
    order(created_at: :desc)
  end

  def disc_count
    self.discs.count
  end

end
