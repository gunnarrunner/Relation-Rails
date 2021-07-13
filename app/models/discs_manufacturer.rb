class DiscsManufacturer < ApplicationRecord
  has_many :discs, dependent: :destroy

  validates_presence_of :name,
                        :location,
                        # :international,
                        :variety_of_discs

  validates             :international, inclusion: [true, false]

  def self.order_by_creation
    order(created_at: :desc)
  end

  def disc_count
    self.discs.count
  end

end
